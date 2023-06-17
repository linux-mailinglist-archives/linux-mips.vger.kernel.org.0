Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3171734118
	for <lists+linux-mips@lfdr.de>; Sat, 17 Jun 2023 15:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236398AbjFQNHc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Jun 2023 09:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235677AbjFQNH2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 17 Jun 2023 09:07:28 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADD819BD
        for <linux-mips@vger.kernel.org>; Sat, 17 Jun 2023 06:07:26 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-987accb4349so73543966b.0
        for <linux-mips@vger.kernel.org>; Sat, 17 Jun 2023 06:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687007244; x=1689599244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yD2mfuV+fqGi2BrJFGebt9olEIT6uNOgf7P1D42KFcQ=;
        b=MBX1P0855t6gkTdc1NHQ+J/Ew1POQStwXIl0hRyX1DvA4Dv/TlNJl6PJ5GXhk+gZZA
         2liu38gJYjKlu32bcsa1jlGSE3kQ11LEMjWHhwYvM43V7AAbKwXixu9JoSxd0TiTFdLQ
         VcTTjzmFK++Xh1V+mEaxuvEF9BeThaYZ2YirEdUKpobdQ6tjVwIIQUxAod1On0+Ynfxk
         iUUDn1WE1O/ZWXny+Y0K1i2tzE19sCWur8I/4+p0WPAbQQblvADnzPTNJw+58AoNSXCX
         NykUO1heXFkGdrrmRGqZpmSk7wGMsYBGf2suXjdd2u0DilHeab5dgLK+NvFsQQKsp5LD
         YE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687007244; x=1689599244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yD2mfuV+fqGi2BrJFGebt9olEIT6uNOgf7P1D42KFcQ=;
        b=Ll+6r+1pMqzhvrsuSpy4pfs5EXgGH0DzBMxZbn0JFG2u+KG915CV3fncdkSQzuLeEr
         cjX0e0au8bRmGtFTZF2cBfRZI4l2AAleh4PBpMIamiNmLOBs0uiQZtJk3HnSvamrUWYy
         bXNVZlYEOhR+CgocsVXR5y7QTXrWFRW481KgfXpo8na935VTjtzrf2GQ6C+p9a6VRWEo
         wQ1jPqpNpLEeZaqiFa3Fc8TJTG0g5Q7yeCRk3ndPwnBzA8FvZVgimN/8lsLEOUONElZX
         j9TkzrF/SPjc3xq6O78SKEucU8iiuUeSUajbPH0BUW7yfY9E09S96JFIrrno54APd7B+
         wprg==
X-Gm-Message-State: AC+VfDyJeTValF7GXqhEvheof3yKNC7RN8Y+9ZkUnf0BuGBAh6gQnVfJ
        XvP3pHN0EdEYUZjT9XgtV59MgA==
X-Google-Smtp-Source: ACHHUZ4gYM6ydBQK0EgrOwyfQoTSFwyHgIxaBPQ5wFrrUb/ITf24ayGCnkR+OuBRp2TvkExH1e9E4Q==
X-Received: by 2002:a17:907:8a08:b0:987:ae30:4b96 with SMTP id sc8-20020a1709078a0800b00987ae304b96mr1706703ejc.12.1687007244300;
        Sat, 17 Jun 2023 06:07:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id t4-20020a170906178400b00982be08a9besm3063447eje.172.2023.06.17.06.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 06:07:23 -0700 (PDT)
Message-ID: <e0f74bdc-3a4b-596a-5ec7-83054377813e@linaro.org>
Date:   Sat, 17 Jun 2023 15:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 2/9] clk: ralink: add clock and reset driver for MTMIPS
 SoCs
To:     Shiji Yang <yangshiji66@outlook.com>, sergio.paracuellos@gmail.com
Cc:     arinc.unal@arinc9.com, devicetree@vger.kernel.org,
        john@phrozen.org, krzysztof.kozlowski+dt@linaro.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, matthias.bgg@gmail.com,
        mturquette@baylibre.com, p.zabel@pengutronix.de,
        robh+dt@kernel.org, sboyd@kernel.org, tsbogend@alpha.franken.de
References: <20230617052435.359177-3-sergio.paracuellos@gmail.com>
 <TYAP286MB0315AB8274CDD341D49809A2BC59A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYAP286MB0315AB8274CDD341D49809A2BC59A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 17/06/2023 14:54, Shiji Yang wrote:
>> void __init plat_time_init(void)
>> {
>> +	struct of_phandle_args clkspec;
>> 	struct clk *clk;
>> +	int cpu_clk_idx;
>>
>> 	ralink_of_remap();
>>
>> -	ralink_clk_init();
>> -	clk = clk_get_sys("cpu", NULL);
>> +	cpu_clk_idx = clk_cpu_index();
>> +	if (cpu_clk_idx == -1)
>> +		panic("unable to get CPU clock index");
>> +
>> +	of_clk_init(NULL);
>> +	clkspec.np = of_find_node_by_name(NULL, "sysc");
> 
> The node name should be "syscon" as the example node name in the
> dt-bindings document is "syscon".

NAK for both.

Node names must not be an ABI, unless you talk about child of some
device node. I don't think this is the case here. Look by phandle (for a
device context) or by compatible (looks the case here).



Best regards,
Krzysztof

