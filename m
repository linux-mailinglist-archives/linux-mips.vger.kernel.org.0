Return-Path: <linux-mips+bounces-12797-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BC7D0B568
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 17:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE2233078CAC
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 16:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FC0364043;
	Fri,  9 Jan 2026 16:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VqThEY/6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PSJBqq+h"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439F6268690
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 16:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976939; cv=none; b=rSzkCKTV5rH2TmEIYKqFcEKTbw4w5r8Ax6dpDajP2d+iH1mRC7cMTOV3lbvKMYP7I9h4dHJ13oCE5BKY8kYPn+/6t939XMyWt4rI/YC1xHiIOQEldazOs92+DcacerwJkZOg4vNF+cztUQl4c2IpVi9dXaK30cNjs8UHvmNRZko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976939; c=relaxed/simple;
	bh=RLFFqIbNChTLd4hG/k1yf98Cg/hVXZ0JejaL07+IA3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZ2TsEfryPKV/DkP9hU+XCiK0AkbLzdqjAFG1s90YCS6TJO6Wq4lYy+R7aSKgFUBQwnvMkRwlkad14FnnGNVwDk2dvnNDZyBRKMrRefTIXZyyI0o9k00mnK0fVL/HHYc8xQSJjAF6cBNPCafUktZzQhaa8w5fJYO1DjtWaS8K7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VqThEY/6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PSJBqq+h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SW/S2wVzYZM3vBT8Rf+7gMzDg0CTydTG7cmC8sQg+jk=;
	b=VqThEY/6nuOQSXfwDdmC8UDrGtkQHppnPldFAl3o2glbIbTuUiAiWyiexu0VEKxBMTYrN7
	iRVCE813jthL/acNaenGuyF99fQH/TwP4YWqg1FCLCatsYN8uy/f6fO6PXELDK7m1bVcS4
	UVbgMGGcSxPpfEEREkRrW6Tr6hVwo3g=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-U0ZNY9gjN7WIX2ZHd0f87w-1; Fri, 09 Jan 2026 11:42:16 -0500
X-MC-Unique: U0ZNY9gjN7WIX2ZHd0f87w-1
X-Mimecast-MFC-AGG-ID: U0ZNY9gjN7WIX2ZHd0f87w_1767976935
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5634f73edc2so1706027e0c.2
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 08:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976935; x=1768581735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SW/S2wVzYZM3vBT8Rf+7gMzDg0CTydTG7cmC8sQg+jk=;
        b=PSJBqq+hiUIQU0VMUChg06oR3t33E5BdBHkbQA9m0FySHVqYXIWqBX7stGK9H6+2ns
         9c4zKxgBfZ4blo+JN6CTeKzqU7Rt86eJvHJZ0AHD8DSGamcd4dIS5qhPswGNfGgY8her
         PpErjiY8GpARxSxcBVU/3SapR3erAwxb5BxYdTUKM0XzvVI3jgn5O7mtQOSkhlWBeDYl
         2UIQ613juhW2DfZ3rhu+7WyiPxaCHLkpfBK3HR2le6Oi/O8ujceewY7zDCm7hn4HZoBW
         DUgP0ZlZKQyoUk1QrTdRojE6uRdH9cKP7/HK49EmWf6Dq/Li98SrZoggqTLH+vWX9OGZ
         Z+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976935; x=1768581735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SW/S2wVzYZM3vBT8Rf+7gMzDg0CTydTG7cmC8sQg+jk=;
        b=wzLJUkYrzZvIqmweo719xt1ClyuCTEEKpMA/eFEwVYqubupfL1kFlCIt925E5AZUXW
         GPeHpp1/2L6AAYI6XqoDF70eD7+eLfDerTxayZIgI/3pvI7eW2zHNrrafOUSkgXtpTyR
         lvqIKLHQ5zO5q1f7Niw/Qhkt7QoMRC+qxPR2H8cZlzU4kdOfYAnCJrg5QZGEM5EGKuPm
         PKlRryKxtGvMrJTb+rgnIkoT3o/FQ4iVYP6c1BMLRDUvpp6fhlhhTNHfHbUpPfHB9IMN
         QiaYXFc7WcScy7RqBSxs4B/fCUYn/BOCUC05KCdpriCaWeq8bobViT4/WjJwOJl9HaoB
         i/Kg==
X-Gm-Message-State: AOJu0YxanWeWvSm00Yd73Pswe+AHVuEzpzWzqvj7M91BH9k8vZwIJeC9
	gC02XHDgV17vJYu9LM8eGYqE3bYUHgLZSO8+2bEwM89t/7j7D4YCT8SUExZ/PY2/0Btctjbe4mL
	LyozBecVV3LKJLdTYWXtIj24UsFk/yON445453NpXUTppVWbXZopO4Cj1gG4RWKM=
X-Gm-Gg: AY/fxX4Y3Gua6+0fls/CclLmrSJY3GE+2srYvdOs8rkiLLXkmLwz4SOBm9kRH/NISyW
	5Tag8jlT6ymwQwd/oFso4tAYfBLN5OO98DldffcQdUB9lmEMu6xqpMPXABxTRXrQ2PX8UxF2m2G
	NhvhZefahTxItojQgyH+7i0/yjEyvQt0z6YfwdF+7SjywbucnKcSX/oCO6VOkzm3fjY5kzh/xaM
	x/jPSezeWvfEmM4/MeNnj3OX9H92wbPjko5/8/yGRF2LLMTfcgw2/giUnfRjGAxH4LCF3FxzNAJ
	lr5zSFLh40oh6l+Hq9+0JyP5Z5Z5TGf+TX5NP9z7HA6Duwof/lOHr8N5MQiVnX0erY65Q4KuYaX
	nA8i9a9HxjKfLyR63RqZeIMfAzv48MHVXVEfWaONLk7Uzrx5U
X-Received: by 2002:a05:6122:4d03:b0:55b:1938:9183 with SMTP id 71dfb90a1353d-56347c355abmr3211878e0c.4.1767976935552;
        Fri, 09 Jan 2026 08:42:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoDt0JNmFKMl+/9Clw5JcowtJ0iZKm1U0atsvuEsRhEvCvwcQSMRY0KEZfDEDK1POtvMYvgg==
X-Received: by 2002:a05:6122:4d03:b0:55b:1938:9183 with SMTP id 71dfb90a1353d-56347c355abmr3211863e0c.4.1767976935163;
        Fri, 09 Jan 2026 08:42:15 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:42:14 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:20 -0500
Subject: [PATCH 07/13] pinctrl: pic32: update include to use pic32.h from
 platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-7-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=RLFFqIbNChTLd4hG/k1yf98Cg/hVXZ0JejaL07+IA3E=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y8c272sO6s6dvbOihwLMYGPTDYveI9t3v1h9dLSv
 c5hOetFOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZiIJS8jw1IvA6s7CmUchkE/
 Pe5u+TdbI3ozz8UczcOSKe7Xue+EbGNkaOTu+L60NJTNRVuwYGnOrrfKxXMaXCzrjcR2ndvTldD
 LDgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/pinctrl/pinctrl-pic32.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index e8b481e87c779291a69490de1892fbb7ec9c45f1..16bbbcf7206288df5f91870e6233970582f7ef80 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -15,13 +15,12 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/platform_data/pic32.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
-#include <asm/mach-pic32/pic32.h>
-
 #include "pinctrl-utils.h"
 #include "pinctrl-pic32.h"
 

-- 
2.52.0


