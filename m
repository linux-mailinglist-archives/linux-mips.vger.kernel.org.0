Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0112E4FA7C0
	for <lists+linux-mips@lfdr.de>; Sat,  9 Apr 2022 14:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241233AbiDIMtd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Apr 2022 08:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237602AbiDIMtd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Apr 2022 08:49:33 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184B22A03D3
        for <linux-mips@vger.kernel.org>; Sat,  9 Apr 2022 05:47:26 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id bh17so22160644ejb.8
        for <linux-mips@vger.kernel.org>; Sat, 09 Apr 2022 05:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RYkFt3jpACagbux2jezQDt+Hlb4Mllg2F+Pvo9I6yg8=;
        b=Iy2/plpTG2l4eGMzjWcPnr0DLlDOGCDFhQbyb2f9WLFdecVumS74oVVqskMl9HG/F/
         dNCj1CG/S8UwtpnjIwEOINnE4ftiBnlv5qieaG3Ak7C7Bnao40qskHKyHlzYLvNabUYi
         tpNQgk8mESb86xGcxLHzgL49y5Ial5x1Ux6jKVNfdn9sC4GOoiIie4HRegfCoB+ohBb8
         9QTCx4Hl4nmk1MMLkg3YlNdWFa/kA2ynDkNahRNYu+EZA8PwVV4rEhkvlS8F1y24zXwS
         TByvKQVsxGyK2thUArKffFYbGPpqlduoamI7Fh5OdV4rLV4vgKeLob2tFZl1+aM37p8Q
         0esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RYkFt3jpACagbux2jezQDt+Hlb4Mllg2F+Pvo9I6yg8=;
        b=OIBsY35nN6PX7oKjbIrx42QXnjeFYc7go4ud1Vz+ypotZSaae0HcKl/hMfHVcQwA9U
         ERY2H7vI+AapyMe1hZ8qlRAKPBJe6GZNoUC24/I6XuvX2GJXg3xz/n7UotYOnE5fPiWZ
         OV6bbNYy79mDVanZrVq0b8JRCQgR6sAG1i/mR0iGzlG6KxLCkT/g6SP1c9PI+b6+N7WX
         MBymLyp1spQlPEIF2g4G261x6Ee/keVsTicUGK9hJaUByjpO0+kiWxlDyAq4JLrpn3Zm
         yE9NzxrDajtDKjdi28sjZyJO7xXy0o5xp/ivofXZ+erqM7kfy9LM6IbKuk8bzYL5XjqN
         OP9Q==
X-Gm-Message-State: AOAM533U/rlJjw0IhY9AyFObDcK3HRICS8mWZq5wzN1XNZoZ2kSQ+taX
        gytBAeN+NI1rqc0PTJd+vFzl1A==
X-Google-Smtp-Source: ABdhPJyHbFNq9sjIttDPtopX84JitwYlNirupvNY03oGBfQPZkHlb0YESQGDm3byfy/d13g9cZRmyw==
X-Received: by 2002:a17:907:629c:b0:6e1:6ad:5dd8 with SMTP id nd28-20020a170907629c00b006e106ad5dd8mr21620810ejc.641.1649508444649;
        Sat, 09 Apr 2022 05:47:24 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id q17-20020a17090622d100b006e87bcf7ae7sm151041eja.208.2022.04.09.05.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 05:47:24 -0700 (PDT)
Message-ID: <2e1495ab-2773-a3bb-0ad2-4af607cccc11@linaro.org>
Date:   Sat, 9 Apr 2022 14:47:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 13/18] dt-bindings: fix jz4780-nemc issue as reported by
 dtbscheck
Content-Language: en-US
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
References: <cover.1649443080.git.hns@goldelico.com>
 <84adfe6237cd4cfd52cb9723416f69926e556e55.1649443080.git.hns@goldelico.com>
 <036b66b2-c221-6e9e-6a56-510e7a0d20d3@linaro.org>
 <VDO2AR.XO9112UD3KYT3@crapouillou.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <VDO2AR.XO9112UD3KYT3@crapouillou.net>
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

On 09/04/2022 14:37, Paul Cercueil wrote:
>> The true question is whether you need simple-mfd. Isn't the binding 
>> (and
>> the driver) expected to instantiate its children?
> 
> I can explain that one. There is the EFUSE controller located inside 
> the nemc's memory area, and the two are pretty much unrelated, hence 
> the "simple-mfd" compatible string.

I saw the efuse children and that's why I asked who is expected to
populate them. You said that simple-mfd is required for this, I say no.
It should work without simple-mfd...

I am kind of repeating myself but I really do not see the need of
simple-mfd in the bindings.

Best regards,
Krzysztof
