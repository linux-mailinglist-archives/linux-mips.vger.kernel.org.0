Return-Path: <linux-mips+bounces-12796-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 244ECD0B52C
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 17:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2F7F301D175
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 16:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8D33644D1;
	Fri,  9 Jan 2026 16:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J1p6aCF2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="q8kAgnnV"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FE83644BD
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976939; cv=none; b=XTPH9/xB0U/6/ibYAEa5BU4CfF/HweQQ9O4b/AnR0rdn2R+U1KpKjQJShFDfMbby1LCif+yENMhezViEZGZKwOYgX4w9U8w5F8cz/FAJ2tcBKj9SeXetTN9GBtTWY3nsU2782vgUYPSkrwotWzizY40HIOG7s5AZhyF3veDl7eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976939; c=relaxed/simple;
	bh=A4IyjiuETdtKqekO7CrVMzxJYv+C5eM8OE3bwQ5VTqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EYVVH3JwC7fu2EK0QlGfmHN7qVQ2ZRlwcI49eoIVO4n7TQhZoBMpyqz8L0uO18FrMoAITLNMdmugZhNyVvtiEIaNvxkxv6Er5ZoijToD7OGTPT+zk494A20rl++YxpixF2EQ7kP5byl8np3T4FmceYgptYIm2CYTsomoVX6P/1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J1p6aCF2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=q8kAgnnV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUeF2oJGFj/TVxz7XlmmyJLItFmPD8ejdDLxRDE0rIE=;
	b=J1p6aCF2mBTo36LBjyRdNgFO+ghCFn9W/HTX51zgeClwVb9ZaH1TKazGqZWyg2ilkpfLty
	/oKny1xiv8GvHdt2VBrFvs2Lrrg7CO17bXeKSuGnWtITw81lbNJAPpPBX+lEIJ4HMJjmhI
	itMu/niwN4K6M/L68O+4v/A3BOGmiEo=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-1AnYdu9tPPqy4eTtrO2rzQ-1; Fri, 09 Jan 2026 11:42:05 -0500
X-MC-Unique: 1AnYdu9tPPqy4eTtrO2rzQ-1
X-Mimecast-MFC-AGG-ID: 1AnYdu9tPPqy4eTtrO2rzQ_1767976924
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5634dbbc1a2so1993289e0c.3
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 08:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976924; x=1768581724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUeF2oJGFj/TVxz7XlmmyJLItFmPD8ejdDLxRDE0rIE=;
        b=q8kAgnnVu5ujaugpZCaJQBJl8GjfdBuktbKVkTV4iQcsenuN8D+K2uP424dk9bZoFB
         sL0LnAB9gJAfJL6yR8PersW2qoWaLh/m4kqtC+uu4QPt6NLCRN+eEqzEh4RyFVy8UbeF
         MvottZhPIMP2EF4nOoO0bUj0x08idGBOa8IwjTYcbvKfYDlnB1ds2EHL5dSFOaOQ9wNp
         kPZOcO+J+71ZCmW/1BQqJpkkrDZIe+et/iqspvFPht1CXVK5xjpfKFcnJwX1vdMp/XLZ
         LTQqN63PZN8wji3xQ8x5Luo+SlIssfqQBZSwWLG2msPi/MAcD8OG6KL6bA0XYzyy5A+i
         bJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976924; x=1768581724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BUeF2oJGFj/TVxz7XlmmyJLItFmPD8ejdDLxRDE0rIE=;
        b=rVF9skHlopUDZmWcZUpSo363yG6P5p8Sh9VSFeKUqj8t75joUnpX6ZA3pdTxzsAFQM
         HGT0iYaKHAZu/odLU9KfTajF6zakjxvlcJJyQJXQwujT5hP2cwiI116nw+yF3PoljqyK
         U3//bM95sc/ilv9gDG9D/z36FdYjhQwenkNcXm5m4QRiAfajrxo3QOrpp6jkS93PeYVT
         ELQ132SHG4x0hH9wz2sv+kvM58/TvHkSJgiq/Kht2aZtvpmD5rk+7KzW12n9xfXq7DcX
         yl0sEedY9zFg7h6YCCC8zkfAv1dqJA5zsquErR+LTvZ2fu6kQyeJEAn9VI3eihXAbSAD
         0fpA==
X-Gm-Message-State: AOJu0YxCJPavG1os52k+em/pMngCI1DQL9HaWnKybAUIU55z9DcFxIl1
	EHc+GzAD5I9yaWXayzTJeaqrTGfQkWPdZUiJEHGQiiefJXey1Z3Msm/XT6Xt6lCWxcyKpHjUCHI
	hJYz8vZk5fyB4TKFe/2tsY19RxE3yVvMo+peaYwQRGKhS+Rpz2Zj3OW6mEhhz5xg=
X-Gm-Gg: AY/fxX7gTVUPWTVjUIUYMt2vnRkWWKxy4rdLVmt6U+Yr4XzMFaJGBlj0PXpYd658hUn
	18m5/mtKqzDAQi7z2QSElFRlr9J1e0FdYFnbGwFCpC379pMk3WuHIayrGARim09DkTCqgsPZ6gT
	1jH8Q6R2UJtWtV3vO6toVx99qSkM0eLveQnQNdyECSUJ3ddsdtLLc6lPZEywj7t9TLGgWfb1f1c
	DCd99UsfPQq0Sxj4QmJlEeIjkzw+CdLUYQXw4vZGXIJg+NWC7kmpTiokARg4qfOA3Qujvx4gHtn
	MTdyCAIyrW5sQm/LywOuejA553wgfF0l64sahvtBY+4+nuJL9/xjptqOR0dbGhdRZcOZWJhgXaa
	mFa4eyUBF9nXWB53EbFwZZIWbtAn6olFK/Upu13WTxDItRp4V
X-Received: by 2002:a05:6122:16a0:b0:55f:f2f3:699b with SMTP id 71dfb90a1353d-56347fad3demr3720447e0c.11.1767976924132;
        Fri, 09 Jan 2026 08:42:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECTMP2WdNP/X05k4GGX0gpofUA/Q2s4pXh/s/FckrwzYXb/WBdeFiwzvWFe5RcdR+ny5C0kQ==
X-Received: by 2002:a05:6122:16a0:b0:55f:f2f3:699b with SMTP id 71dfb90a1353d-56347fad3demr3720437e0c.11.1767976923705;
        Fri, 09 Jan 2026 08:42:03 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:42:03 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:17 -0500
Subject: [PATCH 04/13] clk: microchip: core: update include to use pic32.h
 from platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-4-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=A4IyjiuETdtKqekO7CrVMzxJYv+C5eM8OE3bwQ5VTqU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y+8YF58d3Ln3cJLPxLehJa9v7Ta+6+4ceelKN27F
 Wzpzv37OkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhIx0aGf1qOU9rmRJd+lP2z
 N73z/a6zD3LeVqx6uK/2AOcL2Y3GtxoYfrM94kze5LRom8aVFpkKVc6CPka1/7M1zDWVxd98/6t
 Qyw8A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/microchip/clk-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
index b34348d491f3e1b576b2b9a8a66bfddd8c2296ea..891bec5fe1bedea826ff9c3bd4099c90e2528ff9 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-core.c
@@ -9,7 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-#include <asm/mach-pic32/pic32.h>
+#include <linux/platform_data/pic32.h>
 #include <asm/traps.h>
 
 #include "clk-core.h"

-- 
2.52.0


