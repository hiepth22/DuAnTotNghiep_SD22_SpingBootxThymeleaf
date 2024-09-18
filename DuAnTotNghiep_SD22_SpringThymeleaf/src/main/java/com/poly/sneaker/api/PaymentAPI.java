package com.poly.sneaker.api;

import com.poly.sneaker.config.Config;
import com.poly.sneaker.dto.PaymentResDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/api/payment")
public class PaymentAPI {

    @GetMapping("/create_payment")
    public ResponseEntity<?> createPayment(@RequestParam(name = "amount") long amount,
                                           @RequestParam(name = "TxnRef") String TxnRef,
                                           @RequestParam(name = "chuyenTrang") int chuyenTrang) throws UnsupportedEncodingException {

//        String orderType = "other";
        long amountT = amount*100;
//        String bankCode = req.getParameter("bankCode");

//        String vnp_TxnRef = Config.getRandomNumber(8);
//        String vnp_IpAddr = Config.getIpAddress(req);
        String orderType = "other";

        String vnp_IpAddr = "13.160.92.202";

        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", Config.vnp_Version);
        vnp_Params.put("vnp_Command", Config.vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amountT));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_BankCode", "NCB");
        vnp_Params.put("vnp_TxnRef", TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + TxnRef);
        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_OrderType", orderType);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
        if(chuyenTrang == 0){
            vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl2);
        }else if(chuyenTrang == 1){
            vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
        }else{
            vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl3);
        }

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;

        PaymentResDTO paymentResDTO = new PaymentResDTO();
        paymentResDTO.setStatus("Ok");
        paymentResDTO.setMessage("Successfully");
        paymentResDTO.setURL(paymentUrl);
        return ResponseEntity.status(HttpStatus.OK).body(paymentResDTO);
    }

}
