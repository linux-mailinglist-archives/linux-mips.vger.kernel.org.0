Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB75E65988C
	for <lists+linux-mips@lfdr.de>; Fri, 30 Dec 2022 14:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbiL3NEo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Dec 2022 08:04:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiL3NEn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Dec 2022 08:04:43 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A201AA36
        for <linux-mips@vger.kernel.org>; Fri, 30 Dec 2022 05:04:41 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id bn26so425373wrb.0
        for <linux-mips@vger.kernel.org>; Fri, 30 Dec 2022 05:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F5y32Pwzonf3CvozRM4PbPvchTD4/JJcNSUxK5NgDiw=;
        b=MiC76c5v65Pcm6BqsYSlUf9eYBhZoqPc3E4li4ui9tz3xsMKSzaO3kDZQbpquQ+lVD
         4cUWq33Psv+D7/luW993MrT2eRTbta4OIM1hbegtIQuHqoanOOi4f2W2w76GR+sTUk+h
         zLZPBRyYbZW+MD2YP8dyPWoKFY9ZO/GonwNfUN8UYs3+7qY65dmdzVWmQZ4+/Gu03TS4
         bYmNW+1zcjgsVxz6XYAGHESUmb0aEiZNOpuf3G9Xt/2qqjxqX/uf1e9Sn6HS5C7D2wa1
         ctiQahjDbIgu9J0R4Ik2SBTZdz9AP+f/JLj/Wk/BcTmEZ2pjNMDB80udsERz6rVa48yJ
         TcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F5y32Pwzonf3CvozRM4PbPvchTD4/JJcNSUxK5NgDiw=;
        b=kBeuqNGldg48Ia/jPKAXf1SijOYEDSSTgdHKA9EBDqNSvbvZ/i1PEHkpzSpD3qhBeJ
         RkxHxuMWFLwOk9UUaXeYQRudmIROCgFSUCE+KiGFGEw0Qlvq/MUvlKrlgsuqeLcmV+bV
         FsI19R8eGzhpM5nmORn+WsqntpTcZrBVvaA9m7zczdF2F1f6l6Zsh3a3NNemlg/x0+fQ
         fDVtFOu0wGML+kFFSf9WxLqY0Qljy0fSuQT0TRNI8vdFG96k7t+6ZLstiVBfG8PEp4v7
         cMwPaQIrCb0vTyV8oJ7eFgcYD2FMPM7wtal5Zy0BPdFRXUj/kTgdJrrJEcL36BY4Qczv
         33MA==
X-Gm-Message-State: AFqh2kqsecbLtSQlzdZ8swftY3sNKNsAnnaVwyAb4ijmqkH1EElnmX9H
        /GHo6zhvOYg7p6Uj5hmikbk60w==
X-Google-Smtp-Source: AMrXdXv91qDvoe0E3LEX2Nuy9saUPb8byz4g95rRpux1Byxvl4qHdzte7BwNCRiTG81APPPgHaNKjQ==
X-Received: by 2002:adf:f010:0:b0:242:4c28:c9b3 with SMTP id j16-20020adff010000000b002424c28c9b3mr20611808wro.43.1672405480108;
        Fri, 30 Dec 2022 05:04:40 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id q1-20020adffec1000000b00281b594c725sm10978387wrs.38.2022.12.30.05.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Dec 2022 05:04:39 -0800 (PST)
Message-ID: <d62f206e-f5c7-b0f0-d0f1-516669d31352@linaro.org>
Date:   Fri, 30 Dec 2022 14:04:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] serial: 8250_rt288x: Name non-standard divisor latch
 reg
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     inux-kernel@vger.kernel.org
References: <20221230114603.16946-1-ilpo.jarvinen@linux.intel.com>
 <20221230114603.16946-3-ilpo.jarvinen@linux.intel.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221230114603.16946-3-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 30/12/22 12:46, Ilpo Järvinen wrote:
> Instead of a literal, add proper name for the non-standard divisor
> latch register.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>   drivers/tty/serial/8250/8250_rt288x.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

