# -*- encoding: utf-8 -*-

#    COPYRIGHT © 2017. TCPIP.
#    PATENT PENDING. ALL RIGHTS RESERVED.
#    SPEI GATEWAY IS REGISTERED TRADEMARKS OF TCPIP.
#
#    This software is confidential and proprietary information of TCPIP.
#    You shall not disclose such Confidential Information and shall use it only
#    in accordance with the company policy.

=begin
#Wire4Auth

Fecha de creación: 13 de diciembre, 2019
author: Saintiago García
version: 1.0
=end

module Wire4Auth
  class UtilsCompute
    def self.compare_webhook_msg_signatures(message, key, header_signature)
      digest = OpenSSL::Digest.new('sha512')
      signature = OpenSSL::HMAC.hexdigest(digest, key, message)

      header_signature == signature
    end
  end
end
