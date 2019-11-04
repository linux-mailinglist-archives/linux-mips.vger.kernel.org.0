Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8714FEE7F3
	for <lists+linux-mips@lfdr.de>; Mon,  4 Nov 2019 20:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728427AbfKDTGJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Nov 2019 14:06:09 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39330 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbfKDTGJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Nov 2019 14:06:09 -0500
Received: by mail-pl1-f196.google.com with SMTP id o9so1354884plk.6;
        Mon, 04 Nov 2019 11:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=PkVlV2Kz71aAlcTBdoUnpir/PBHm1J2bry8CrnLTwNs=;
        b=fXGc4ds3UI8vOfPZTL2s66iJSnk0h/QOj9fjrrdgeqMi0Xul+8nGor0ZuuLing/Vo0
         BU/1VjvJAuuaHP+mSH56nZi+mailf3WiM/c+QTD7UjeiBwGREMI4yIuQTp2k5f8i9xFI
         U/8W2MGbBQH4Hm6usBXhWce771P/Yu8Cv98FSdI99ybRsKdaX1yEnVIvi0icxepD/AbY
         qUFv/vI/kxDRajmEXlli8xJ53sW0B9EWl+yDs5dSXlAYO0pJxTAB4to1K3tNQea/6WRQ
         +BkUEDa/ouiDF1lH8rFOEqcr8FwUUNfdABEN+IM1u6Z9DfSCuPC9d39GcCIDNPzjo09g
         F/Ig==
X-Gm-Message-State: APjAAAXVoQSudQKcKogX3fYGeIfHg2pHSM7Bcv9+VwN1Q8sUCRKtb7wB
        l4yP1jXUXoX54WXVGRvRByY=
X-Google-Smtp-Source: APXvYqwHYaIj/xZhKh09dH6XDZ2Wqs1GhAknR+TaXRPmeAelIzMYlAEzFBUVUr3GwV5/RJDPdzb3Ow==
X-Received: by 2002:a17:902:9a01:: with SMTP id v1mr29523284plp.132.1572894368786;
        Mon, 04 Nov 2019 11:06:08 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id y16sm17702772pfo.62.2019.11.04.11.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 11:06:08 -0800 (PST)
Message-ID: <5dc076a0.1c69fb81.bd82b.3c69@mx.google.com>
Date:   Mon, 04 Nov 2019 11:06:07 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
CC:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson: Fix return value of loongson_hwmon_init
References:  <1572874430-28903-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To:  <1572874430-28903-1-git-send-email-yangtiezhu@loongson.cn>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Tiezhu Yang wrote:
> When call function hwmon_device_register failed, use the actual
> return value instead of always -ENOMEM.

Applied to mips-next.

> commit dece3c2a320b
> https://git.kernel.org/mips/c/dece3c2a320b
> 
> Fixes: 64f09aa967e1 ("MIPS: Loongson-3: Add CPU Hwmon platform driver")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
