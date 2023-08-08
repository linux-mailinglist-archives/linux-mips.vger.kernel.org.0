Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 305217746BE
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 21:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjHHTAb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 15:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233409AbjHHTAM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 15:00:12 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F3586272
        for <linux-mips@vger.kernel.org>; Tue,  8 Aug 2023 10:27:57 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99c1d03e124so777712266b.2
        for <linux-mips@vger.kernel.org>; Tue, 08 Aug 2023 10:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691515676; x=1692120476;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMnxgsCoh82ZoNEGZ3gXMUz0wSz2MoqQmZYxTHk1iuo=;
        b=e7yV6IOkNSCeZZsVibNiT5gI/GbDgoeGbLmZOb47unvbAMMruuoI+D5UmADUwXlssE
         joWNT5DQEp2XgNsUsBLw0XwGj8muOJDt0qYxlo/5izoPbxccvSvVYLm73ZATXd54TRNQ
         DyA2Nwh6GKU/e7iLqjzKTAYZCd/cyuTCaDiDa9HDpkz+lmg7/XeyMBuf375qER+tGsS8
         PFW8Y8Hh/zqzqU/SriIdHWa818yZKuvDWAAgo3uspQndCIGv01Od8wSUZwcG9MlawPEr
         0KRUP6jTwFQ+UgKToTdDlSN7NhRd9/fJMGS8V0DC2LYkQs1Ui38jkVKzEaXL5jm+t1Xw
         CBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515676; x=1692120476;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gMnxgsCoh82ZoNEGZ3gXMUz0wSz2MoqQmZYxTHk1iuo=;
        b=YUhhF0fL+W3byN6Oo8xhZ9LdIABvpfTlAhFd0K9H9zFNJz6/Sip++ZCvepf8uj+y9D
         EnwrhrfISwD9FCTy1R/xlEh0/72gxF/qNP7m4GI9IrA1Hq6l4Fca6h3bfi+pT9Alh5Tg
         niwNLY6Fw41wzvlELY7E6hTDsJcrhdnLxBSXbzaQqZO9Yaa0yxYJuKa29vmPnO6M5QWk
         XSiWfO1UxYhMleUM97Lxydlz0ayxpyK6XQ75YQlOnUfnbFFgnZaJsIo89vY8VbL7vKZz
         wAPf6NW3J0C5vjRzSfdpw/ef2gbdEGsjReYpIdW3USPXVcVwqhswiScNJ4kXKmboP/Iw
         rqJA==
X-Gm-Message-State: AOJu0YxWLD1utwVUF6Gz63DlxtfYyZZenxR0CRXpYTmoQaOCqeTDEprS
        oaw2tf0H4fLJEsI9feT9RIXyU/UveajCG+hr/fI=
X-Google-Smtp-Source: AGHT+IGh6quNsM0lZU6+CofawmyTZRbZPfDUraQexF9fMQWdjRw/ox0syxTlOeazcQZlc3UFNsK4eQ==
X-Received: by 2002:adf:dfc8:0:b0:317:f1dc:36ed with SMTP id q8-20020adfdfc8000000b00317f1dc36edmr2849673wrn.47.1691487575619;
        Tue, 08 Aug 2023 02:39:35 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.177.253])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d474a000000b003141a3c4353sm13080004wrs.30.2023.08.08.02.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 02:39:35 -0700 (PDT)
Message-ID: <794d4bfc-2404-9f4f-4a00-f5edf44a3f5a@linaro.org>
Date:   Tue, 8 Aug 2023 11:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] mips: remove <asm/export.h>
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
References: <20230807153243.996262-1-masahiroy@kernel.org>
 <20230807153243.996262-3-masahiroy@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230807153243.996262-3-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/8/23 17:32, Masahiro Yamada wrote:
> All *.S files under arch/mips/ have been converted to include
> <linux/export.h> instead of <asm/export.h>.
> 
> Remove <asm/export.h>.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   arch/mips/include/asm/Kbuild | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


