Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A09107A5D
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2019 23:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfKVWGV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 17:06:21 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:45743 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfKVWGU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Nov 2019 17:06:20 -0500
Received: by mail-pj1-f67.google.com with SMTP id m71so3600426pjb.12;
        Fri, 22 Nov 2019 14:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=gYwtUyjhfQJO55CeJjiXNQYOVnbnfsUZpOJ1fNxmnfo=;
        b=WcvlM2QldpR5RCCPd2G24za8Gm0JxZGPm1Xr5jaKajO37rS1X1G1O86wYSYbuPTM+w
         OUpRW+txv0rnzVOqwEiPiJy6fNKAz8aPZDOZSio0q+qq+MHMs4NAhkKBu9DUVT3QSNn/
         D5pXSFhFiAhAF86jnPFoTTFZhbaX5v3+ADbYz8zERqh9yemwyPiWOiQdRRaBMo82NpxW
         zuiuP52JF35w9ISOuJZfYplkTDuW/NliGu0H0ZKQT+0VL1z/XRDZ8CCcxTa5NFUITu/Y
         qDcA4Jf0CPyxuKcbnTBMms8cZquGBYm03CostfP2SjofyNM99Y1dRBTXnhrr642CKdLy
         hijA==
X-Gm-Message-State: APjAAAWdY8UbmOmesyyyrv+IvD+ixHe2404Yw8NT2RcEza8P8HujOzzr
        m1Puv24byibtP+quU0aJCNc=
X-Google-Smtp-Source: APXvYqwpDtGaQ9U6/aBWqQU74N8yQmKh5r2GpaXppdqgMnTK2V1ydmdllaKGrVFFsHVt2aFFesh58g==
X-Received: by 2002:a17:90a:1982:: with SMTP id 2mr22282116pji.30.1574460378513;
        Fri, 22 Nov 2019 14:06:18 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id y6sm8447744pfm.12.2019.11.22.14.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 14:06:17 -0800 (PST)
Message-ID: <5dd85bd9.1c69fb81.55be.599c@mx.google.com>
Date:   Fri, 22 Nov 2019 14:06:17 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Zhou Yanjie <zhouyanjie@zoho.com>
CC:     linux-mips@vger.kernel.org
CC:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paulburton@kernel.org, jhogan@kernel.org, paul@crapouillou.net,
        jiaxun.yang@flygoat.com, gregkh@linuxfoundation.org,
        malat@debian.org, tglx@linutronix.de, chenhc@lemote.com
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/2 v3] MIPS: Ingenic: Disable abandoned HPTLB function.
References:  <1574173727-123321-3-git-send-email-zhouyanjie@zoho.com>
In-Reply-To:  <1574173727-123321-3-git-send-email-zhouyanjie@zoho.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Zhou Yanjie wrote:
> JZ4760/JZ4770/JZ4775/X1000/X1500 has an abandoned huge page tlb,
> this mode is not compatible with the MIPS standard, it will cause
> tlbmiss and into an infinite loop (line 21 in the tlb-funcs.S)
> when starting the init process. write 0xa9000000 to cp0 register 5
> sel 4 to disable this function to prevent getting stuck. Confirmed
> by Ingenic, this operation will not adversely affect processors
> without HPTLB function.

Applied to mips-next.

> commit b02efeb05699
> https://git.kernel.org/mips/c/b02efeb05699
> 
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> Acked-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
