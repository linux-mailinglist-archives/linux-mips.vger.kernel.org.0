Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189791F9D72
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2020 18:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730431AbgFOQa3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jun 2020 12:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730135AbgFOQa1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jun 2020 12:30:27 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5964C061A0E;
        Mon, 15 Jun 2020 09:30:27 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ga6so68925pjb.1;
        Mon, 15 Jun 2020 09:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=ASmt28ZfnzD93uzKYATIUhSUcUfooSj22w2duyIt7AY=;
        b=et3m76/iHThHfneXsKeu5YnEa+PruBQQXKk9HqWY4ZoZOUTlnPRy9n10dLSgNeBqXa
         FxaXy+tVLhlV9Nsa/d78ifONIRhgp82gFfUecYCgQJrV7SSRBLVS3Hdm5WXCSqjKFz4U
         lxMvOyk7im3iX59lVLBFwEKrrauiggT/Eao2r340PMzYLo0Tw8nNE/2niSDKaVmaL2s+
         VwIcEccOfwRi38aACDklaFwAyPfPtJc1NPTfoYVVRFb+4MdiKCsOQ/MqgsDnpuKyoDZG
         KPdGfDG/CRCBvpQV8TI3Ud4B92KuEkSlF36OivFoH5megJrnyFKDFINZrlxH6vjNhHzS
         78eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ASmt28ZfnzD93uzKYATIUhSUcUfooSj22w2duyIt7AY=;
        b=tAkZLm1MV9IN1d7/ypu89p5adOT2eesnmP3l1RrnL2cdj8tPt3KsWBS5aZIWma/efX
         zK4CUWAzaBfbiZvm5MngGnitEbZMuUI8tx6otFLqqUK7O4xKEp3KBfv/HpE+i+v9uU0U
         UktDa+PaVrw19t3agGMRrZX4EveR4qmhBlu6ifwnAP/93Wok3hh3BD4nd0og7rSUnjqk
         68S3vUBDm4hv6j3/BDZbF+YBYXRQTdCGn/tXUH8FP4FpYMhzqLNG9opLplnmiBZ6hg86
         3Ch09qm6fxQ5LjVcBo5u/qOwoEuoaCZIgf4RIGz4iVUwH7MFXKzDOKkq0wZay7YOdRGy
         2ofA==
X-Gm-Message-State: AOAM533CMQxWqZhKirVVtSxRY7kJ7ipahqTte8O2wr1PkgAjTryfJfaP
        P/TM9SGS/QOHmShP4eGZzz8=
X-Google-Smtp-Source: ABdhPJxnlnBVRkWoafdExfTsdOI0XxhF/LQdTziOsh4cHc+YwBthLB9vTd2LIM4dNN9St0wT9gR4FA==
X-Received: by 2002:a17:90a:6886:: with SMTP id a6mr154721pjd.170.1592238627113;
        Mon, 15 Jun 2020 09:30:27 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id y5sm12126709pgl.85.2020.06.15.09.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 09:30:25 -0700 (PDT)
Subject: Re: [PATCH v4] mtd: parsers: bcm63xx: simplify CFE detection
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, jonas.gorski@gmail.com,
        linus.walleij@linaro.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20200612073549.1658336-1-noltari@gmail.com>
 <20200615091740.2958303-1-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <748c496d-cdc4-d243-71bd-c7f16c2f8311@gmail.com>
Date:   Mon, 15 Jun 2020 09:30:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200615091740.2958303-1-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/15/2020 2:17 AM, Álvaro Fernández Rojas wrote:
> Instead of trying to parse CFE version string, which is customized by some
> vendors, let's just check that "CFE1" was passed on argument 3.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
