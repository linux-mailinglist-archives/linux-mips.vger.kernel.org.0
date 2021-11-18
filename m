Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C879456208
	for <lists+linux-mips@lfdr.de>; Thu, 18 Nov 2021 19:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbhKRSPP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Nov 2021 13:15:15 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:36547 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbhKRSPP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Nov 2021 13:15:15 -0500
Received: by mail-oi1-f181.google.com with SMTP id t23so16084581oiw.3;
        Thu, 18 Nov 2021 10:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZWdr6e4SiKEwyVeW7jig9nB/OfdKCWQxGTViJArBtNk=;
        b=Iad+sKd+t5EJ7SEr0ju4oISmk39DnvwklXYlV/16ZFAAwhyh+CG/hvYfxE3TOaT+Qg
         BcA1bzH7sAH8UGOVvxIZbgAmOHDr1vaeY610ar+/D8832ZkWlyzS1NoO1CkbAIgOQPB4
         Ks03Kv6aDPYs89mAqIq3uwmdhRGUgOii0RxYPvJp+aszzuLcRTcK/6VwnIMHxurXxpDy
         w3xrYXyW/4upgqV0WsSXSYjTQvr/no+KLI/djugdvTRde/gYFT5iQCboZm+hUyuO+rZW
         419T3vV013XRqc5pVOJF9yJLWnczyMFeii83cOdyPca+KeXqd0NiHTBzKsTcXN8Zk4BO
         7yJw==
X-Gm-Message-State: AOAM5331djO7LfGJWCxe6S/zyECHVoUiOBgfyk6RLdu+IfmaQ46cDZeu
        /7FlaWFTOmKVp60aqD85r4o07W+Edw==
X-Google-Smtp-Source: ABdhPJyMTHkFTgzUFk6reybeEUonyuO0UVS3U62hmM+wu1p7V7zF8Vjh3UeI1rSTPyE7qMTSz5OFmg==
X-Received: by 2002:aca:7c3:: with SMTP id 186mr9614934oih.60.1637259134717;
        Thu, 18 Nov 2021 10:12:14 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id n20sm99339ooe.7.2021.11.18.10.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 10:12:14 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Frank Rowand <frowand.list@gmail.com>,
        John Crispin <john@phrozen.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] of/fdt: Rework early FDT scanning functions
Date:   Thu, 18 Nov 2021 12:12:09 -0600
Message-Id: <20211118181213.1433346-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The early FDT scanning functions use of_scan_flat_dt() which implements 
its own node walking method. This function predates libfdt and is an 
unnecessary indirection. This series reworks 
early_init_dt_scan_chosen(), early_init_dt_scan_root(), and 
early_init_dt_scan_memory() to be called directly and use libfdt calls.

Ultimately, I want to remove of_scan_flat_dt(). Most of the remaining 
of_scan_flat_dt() users are in powerpc.

Rob


Rob Herring (3):
  of/fdt: Rework early_init_dt_scan_chosen() to call directly
  of/fdt: Rework early_init_dt_scan_root() to call directly
  of/fdt: Rework early_init_dt_scan_memory() to call directly

 arch/mips/ralink/of.c                |  16 +---
 arch/powerpc/kernel/prom.c           |  22 ++---
 arch/powerpc/mm/nohash/kaslr_booke.c |   4 +-
 drivers/of/fdt.c                     | 121 ++++++++++++++-------------
 include/linux/of_fdt.h               |   9 +-
 5 files changed, 79 insertions(+), 93 deletions(-)

-- 
2.32.0

