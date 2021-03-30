Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0DA634EF14
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbhC3RLk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232348AbhC3RLd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 13:11:33 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DA7C061574;
        Tue, 30 Mar 2021 10:11:33 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id w11so6503636ply.6;
        Tue, 30 Mar 2021 10:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=d0pBDg/3fWXXCUbMj8wvJAIYquVz/rAItmNF4aVA5+w=;
        b=osoVSC92u2gL1ldrOLTbpRwgCsTiHu7AQze3UnKoqRB8+9Ocn50wN2+6HsXqQjLEf0
         9S/iBZsmEKiMM5fhGPy/IWq6FnCnz4d7PfKixPzc3LuHOWIYgcP6iipTA4aYunwaqRMc
         uiRUrRoDd6TU1HxxjO89WO/JShdCbyg1BTPY1afk/J9EW5nSXxgdWs04JcKrrT8xOqzj
         Y/mFC7STObdyte3jEga8FL/kFPyYSRz3ItYNNahZ4uf82X2ByhjORCVppQ7lGawqc+bK
         cYQbmEakY1Xl3QOZcVUbxN3ITDHsx+UW5xvkesOzGH8vM/s0Zi5JAm+F3UzBCvuKsuiB
         Jp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d0pBDg/3fWXXCUbMj8wvJAIYquVz/rAItmNF4aVA5+w=;
        b=esO/ZLo9PTPJfdkc+jg5uH4BRNATTs1wYydOIvrpOGsCnPEqHnqnF9albfrvUfOYO7
         EamWvZagYxmkbjVX+qfK0G1gj12s/hNUk6pQXM7JMhbY4HPU2kh4Son1yEomM/lkTWct
         +APHgRJiNOxXJF1w9Y9oH59ZD02+nYeLUvpokKmm6d9QPnsIx1ksFkiQWnG+hUkvkhBg
         PpMMHiwOuS69MRHz4BnMjDBrbOwCCkzsGRlr368f0za1ZPNYflyzK+jD27HqfaLratQ9
         SuMO+Em/pehUQERY/b8WQQDrCp9tI5zYKoTJtNuVMOF/x634fe8MO/28g0jlawyPNcKk
         kSEA==
X-Gm-Message-State: AOAM530C1E9y5ITTXdTWeZlzGgm1WmDi+sbFXrNBFNL5MUWTMvwNoTXY
        VDmOa2j069KPl4hdYE2JbHGh2wZF/w0=
X-Google-Smtp-Source: ABdhPJxQ8Ab94xkIPGmZ+3oEbO8x0Ay8uT3s9w13SXTwr105ycfATV/DhVCEWD7AzUtCrt2Rz02Wew==
X-Received: by 2002:a17:90a:1502:: with SMTP id l2mr5142119pja.149.1617124293091;
        Tue, 30 Mar 2021 10:11:33 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id x22sm13903326pfa.24.2021.03.30.10.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 10:11:32 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] mips: bmips: bcm6368: populate device tree nodes
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Paul Burton <paulburton@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210314164351.24665-1-noltari@gmail.com>
 <20210314164351.24665-6-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e2b1bc16-4ea1-68a6-6a41-0051a87eaff6@gmail.com>
Date:   Tue, 30 Mar 2021 10:11:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210314164351.24665-6-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/14/21 9:43 AM, Álvaro Fernández Rojas wrote:
> - Rename periph_clk to periph_osc.
> - Rename clkctl to periph_clk.
> - Move syscon-reboot to subnode.
> - Add watchdog controller.
> - Add SPI controller.
> - Add NAND controller.
> - Add USBH PHY controller.
> - Add RNG controller.
> - Add cfi-flash controller.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
