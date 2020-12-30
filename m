Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037572E75DB
	for <lists+linux-mips@lfdr.de>; Wed, 30 Dec 2020 04:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbgL3DlB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Dec 2020 22:41:01 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:45055 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726138AbgL3DlA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 29 Dec 2020 22:41:00 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 68B719F4;
        Tue, 29 Dec 2020 22:40:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 29 Dec 2020 22:40:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=EnbvupgUcqMHn
        hhla+aVj4XmahMxnztlACAsry5tZ9Y=; b=Cq9jMCIgW/GhuAWEiOp0gghMCPcio
        j/PCETrkoamqXDgD4Gg0nvmWLwAT7WRSA3My5axhGuTWuF4tkcBtRKT9+sZyOcAM
        dYuL7OAhdVNi6/TcBP/arls0EiManaoxvj4ycdnIKzWPnOO9fG2A3NJX5FJmpnuD
        1qudTiZQ4yfhuwEGjvrqZV773QQheUqbNAt8JVSDpthuSmXNp9oYdQrFjz4dngU1
        WmDBAOiQ5VdeE74eDf2wvNLer/NUxLR92tIFRajG/7cd+CqACkJ3DBowTvpAzZL9
        YYF85nFZ6t9c88wmOLo3NveEx647iW/t3in3mrQfUs3mLtSd5tCeC7xpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=EnbvupgUcqMHnhhla+aVj4XmahMxnztlACAsry5tZ9Y=; b=KZZY9JVw
        hcD7RS73QA7OfBLjKgyswZF/Wc0Dg+KnpiMDcN81cbB4jU+rKavQUTn48V1idIlp
        /ZT9wFpRH+X5N2U2llPR4MEPl1aGDmF+GiUwAn2YwPJiU/4ygfoXd0HQRivaf9Nx
        aYBQWGWPQnoLpF8jJNZD4k1d1zP6n0hdC92m0SbkK8xYahvazDt+JvZvrXNW5q9F
        aSpz6H8eMO9D1qJ3yJqg4087r2XhSiv+Uk6YPtEeaE4e0p829HpCBri2AcU4PHTh
        P4p9BDlPTeBYcmfVvArFU8iF0PuAMjBOr08e/zlLzwari+SL8ratR+SHltrzVCJG
        Qa9iRC5FGnA3zw==
X-ME-Sender: <xms:nfbrX1JtRa0StaiToQLaSgiX54lDZfN4vGVLee1bPtJoKTNIaADIcQ>
    <xme:nfbrXxJUVVJJc2-ng9jx-ZUjaLinMuuL3la90d43VhX5LghYT7mhX89hBkxj92Aef
    mQo-1nBqxlyf97vcmU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepjeeihffgteelkeelffdukedtheevudejvdegkeekjeefhffhhfet
    udetgfdtffeunecukfhppeeitddrudejjedrudekledrudejudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:nfbrX9tP1csz8Ogqt5tNeq-WhqaLRyQIMMu34v6sixFrEJ8ICIwREA>
    <xmx:nfbrX2YuWTyGfWmtq1ofyyM18PiKsgRUAfcatp5MFBjuPsWME4xZQg>
    <xmx:nfbrX8Yp9EfMt4ufnAommHf9mCJR0NaIisz4AvZmAzek56slPdZKqw>
    <xmx:nfbrX7lp1Ky0pPNStAt_RRdpDlfqyH1wDFpgVwlREcieGPKCp4louIMnDc0>
Received: from strike.202.net.flygoat.com (unknown [60.177.189.171])
        by mail.messagingengine.com (Postfix) with ESMTPA id A3A13240057;
        Tue, 29 Dec 2020 22:40:10 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: Loongson64: Set cluster for cores
Date:   Wed, 30 Dec 2020 11:39:49 +0800
Message-Id: <20201230033950.13839-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20201230033950.13839-1-jiaxun.yang@flygoat.com>
References: <20201230033950.13839-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

cluster is required for cacheinfo to set shared_cpu_map correctly.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/loongson64/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index e744e1bee49e..fae3a97d853c 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -403,6 +403,8 @@ static void __init loongson3_smp_setup(void)
 			__cpu_number_map[i] = num;
 			__cpu_logical_map[num] = i;
 			set_cpu_possible(num, true);
+			/* Loongson processors are always grouped by 4 */
+			cpu_set_cluster(&cpu_data[num], i / 4);
 			num++;
 		}
 		i++;
-- 
2.30.0

