Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF3874FA710
	for <lists+linux-mips@lfdr.de>; Sat,  9 Apr 2022 13:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241507AbiDILOV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Apr 2022 07:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241528AbiDILOU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Apr 2022 07:14:20 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E9099EF1
        for <linux-mips@vger.kernel.org>; Sat,  9 Apr 2022 04:12:13 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id v20-20020a05600c15d400b0038e9a88aee7so3989979wmf.3
        for <linux-mips@vger.kernel.org>; Sat, 09 Apr 2022 04:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9ZLrL9LLe+6i2XIOen61i69IcH4+0kwxzHmEq7Uc2qs=;
        b=Uz2GkDyTy68upHnI+Za2zKW7LLOyxnFFZfskgkH64UHpeQnLwY34bf3893GpnFqfh2
         76m+FeU/VI/G05bsgAXkRwp+Ym5tdAb2PqeMKvS8KioqvYJe+vIOTOzCU/BffjO7eIoI
         JJTjEH64gi2jhhNFX+JxuezyD8moCFSFKM8jw+HI1IAee71kPgKUE36AivqFcSdGQdXA
         CWe1MTUPKsrAUnZsEpPbS0FM3deQrRwG+7sEXxiCJsXF6CJERQQntOSyrNT+AsoulwXF
         /EbSvTVd4K0nZiza9b5RmkdC5bpgE38h/LWa2Adbd6UVFRwBcFYALPwkodj4OQwyZ3uN
         IeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9ZLrL9LLe+6i2XIOen61i69IcH4+0kwxzHmEq7Uc2qs=;
        b=BrH1xSTuMoculVlex5h7MWjqFnearTjEbsMQPmFN9bNz+kL/ObVMtHb3fwJwgpku7Y
         6lo+GVl33O89COyr0VrA/IQDz1GTrJDy5goCsjIoIB5ohGqO8O1Msqxgg5IM+9Mub9j2
         wHvcPTyAIjZoi39QfILiEPma+C2q+cHQ/VV8BkxLtsxkNVJ8+VGjqjY6e8pCfwyGy4eu
         a2d/WtpgomgiaAw4CH94/03KKX0LqbTEByfuv4CZ35Iv3mhJvV57gdDpGvyiLp92scop
         8FiML+jQ2U0sMub6CfSyGml4ab2rcFx7d8A/BmKNTGaY8n4fWIOFpFlGzPndkQlBPZ22
         a9Jg==
X-Gm-Message-State: AOAM532GrpVLaEsIAKhztdb47bfp6lzADYvOvAoPIqfb1IODqHVNflWi
        CSo4BeXvnns056QJAT/rjDQAmQ==
X-Google-Smtp-Source: ABdhPJwLYg96ZGqhVnBxuTk7cBWckWvhDhB07dIYTJsUd1PxdS6Ln7O0dHweb2MDermuLqcroKmZ7A==
X-Received: by 2002:a05:600c:600a:b0:38e:9e7b:3144 with SMTP id az10-20020a05600c600a00b0038e9e7b3144mr7322785wmb.105.1649502732130;
        Sat, 09 Apr 2022 04:12:12 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id l126-20020a1c2584000000b00387d4f35651sm12633672wml.10.2022.04.09.04.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 04:12:11 -0700 (PDT)
Message-ID: <4d85b9b9-c5aa-5777-a56b-29a444cef3a8@linaro.org>
Date:   Sat, 9 Apr 2022 13:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 04/18] MIPS: DTS: jz4780: fix ost timer as reported by
 dtbscheck
Content-Language: en-US
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
References: <cover.1649443080.git.hns@goldelico.com>
 <2b5e2b5b9b1c435043f3eadf4919562dfa9dba70.1649443080.git.hns@goldelico.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2b5e2b5b9b1c435043f3eadf4919562dfa9dba70.1649443080.git.hns@goldelico.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 08/04/2022 20:37, H. Nikolaus Schaller wrote:
> arch/mips/boot/dts/ingenic/ci20.dtb: timer@10002000: timer@e0:compatible: 'oneOf' conditional failed, one must be fixed:
> 	['ingenic,jz4780-ost', 'ingenic,jz4770-ost'] is too long
> 	'ingenic,jz4780-ost' is not one of ['ingenic,jz4725b-ost', 'ingenic,jz4760b-ost']
> 	'ingenic,jz4760-ost' was expected
> 	'ingenic,jz4725b-ost' was expected
> 	'ingenic,jz4760b-ost' was expected
> 	From schema: Documentation/devicetree/bindings/timer/ingenic,tcu.yaml
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

The same as patch 3 - needs explanation.


Best regards,
Krzysztof
