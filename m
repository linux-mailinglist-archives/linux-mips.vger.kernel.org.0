Return-Path: <linux-mips+bounces-12801-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0812DD0B5C2
	for <lists+linux-mips@lfdr.de>; Fri, 09 Jan 2026 17:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F4E4309FE47
	for <lists+linux-mips@lfdr.de>; Fri,  9 Jan 2026 16:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CC023EA8D;
	Fri,  9 Jan 2026 16:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aFQDKuRv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PWIbMeyY"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D1735C1B8
	for <linux-mips@vger.kernel.org>; Fri,  9 Jan 2026 16:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976950; cv=none; b=e2eE4SVv1I/bw0jB6T1FsvSwDTlIvk7nUaaGbYSE4OgH36empF5i36DJ7cfRavTS9OvAYkyXS53pJAfgDkbg4CVcHNLZrVHOdU/4XBnnd4Nl30BC9rKSBiVpn0Y7fzVwAHLULfZf20nAu9TQo5ZWxE77kCzF0zTWOHVrVD+oPFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976950; c=relaxed/simple;
	bh=ujjrCeYW4Gws3dC552q2XCMpqxd2pU0ffvvLryV2FnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8l/ufSJhOSGQ+A8yiwZlhKrgKOUBJRHrOOjVWq8kauCOKDnoxI68ctFdmvG7vqKA9r0AQB+KSVfVXSX7LKZEMC0JKXit3tgXGJbVRvgiFmAoMxzD/35I5fWfnj77cYFqs5xth+UIp2G3OzH4QsuuZp9wFR0i9l35HXhNYgQawY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aFQDKuRv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PWIbMeyY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPVVsDO6rA1DUsYXI1T3bEgIhuRr3/ZOG3IZ44Wx0sU=;
	b=aFQDKuRvcjDW0fR8gru4LTmjCb8AlkEO2aAwQVYTD/nyuPX5c0L2qqX1ZvrJ08NXt0RAbT
	zxCA7RasWy8e9e2ByBzsnJSreRBumoIsu5q/cCAbhjvbzzfl2vtEeoLY4I7cSrW7pH+zzH
	syseafxplzpDGB+TsGxOw7lUJnk5ZZg=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-F3GYGY7RMZCHa7kyyBCzhA-1; Fri, 09 Jan 2026 11:42:24 -0500
X-MC-Unique: F3GYGY7RMZCHa7kyyBCzhA-1
X-Mimecast-MFC-AGG-ID: F3GYGY7RMZCHa7kyyBCzhA_1767976944
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5635a9e4998so1455634e0c.3
        for <linux-mips@vger.kernel.org>; Fri, 09 Jan 2026 08:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976944; x=1768581744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPVVsDO6rA1DUsYXI1T3bEgIhuRr3/ZOG3IZ44Wx0sU=;
        b=PWIbMeyYMtR7uglmmdyRs766SDvG800Kd1X1p8GddriL0MBh8CUFt6r21xCnJHQRot
         KSN5THlh1WEOX/mx0v7a3AU29Ah705BhJ3GWrpmdKhq3gdf+jENxRhEVvkywhUbljlbC
         0r7kr99LlPD7XgeJYfHJp2bczpGvZijW71/KHW1DSvOuQl1SWUeZtHR6m6O8JKByMkLm
         3zYKFBYXe6nzquk4W7tlmNqf66ftz9s9gbvhoDbj+M8r9GPrLfVSdN2dbziBg1rRp8CV
         G6xl+URQ12T6lAFrqW7QacFQtrC61R7Zgq/fLnYEHB64mKuN7WW1yR00v04SReL+37pp
         SJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976944; x=1768581744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xPVVsDO6rA1DUsYXI1T3bEgIhuRr3/ZOG3IZ44Wx0sU=;
        b=GO56tAOKg9nVAzMkC2I/XzPCpwrQaAkqgkzbiOrH6Py+FyfnYIrJyPn9QhzXo7GTR7
         EKHnAgt/wfr9A0aMaaYH4mjMGVwrpiRXtTAP5VORiUPnnDoJcVYlmqPAmYnK6OFV4Upp
         ZXLkP/XO2BnoiSvGAk7XEIliCraXOM9etExjW2Zzb5EpdsPMcOT3FWhLCy135oE8UKMv
         7uDiBgbQZF+ojHXC0ynON/2ZmNNwXCa1jZEDxzLOBpS4mdKKJoYNnn7zLKpcbuqGd5/N
         9GOsJO+0B4JrBJ5MstRQbvOFAOhCCWmgUbbOu7y0o27PTMaRkoFXpsKHjYSvrHPKDp2F
         BHnA==
X-Gm-Message-State: AOJu0YwDscUm5kbfqb65T8w7rWtQ/dzeeBNcQ+LofTTq9r3ajDb4n5sM
	vSn1ySG0O6QzjaVhjlF3wB1mu4ijmIIvEvLSHoSBa0u+0JDX0VZFYGdgFuTG7B6y5E6mAhVH2cl
	Mp0NV0dknSsxG+1cgbEm8itdt77VjZHY0ZH9WMjnBcr1CBxSL3TxOrCO50L1Efaw=
X-Gm-Gg: AY/fxX6+i1/uIvrseGjl8n+NiM83tEt46tQyNqsUxqrQ/zxZbM3QpedeWI1OvljhDZh
	GLEU7kYJ+l4R+aDt5SFb36QF3DZvyR28V24BTHPP4fyF96jrs5xBlOmiWFMHxuwrK3FUwCMpeob
	GyueQwxElaOlbfmzIn/zb64RsFKLEdv/bCySUb5m1o8mvKyynFfZU+ra5MGgK9pVJBfML4J3ay7
	anVzwoDaAd88yfQwQpAPncalF9p26fk/wU7CF5dRm4I3wzIrwHAkDQXIVe1vF1oXiQUszSbWvta
	yErz7O9G7ZSm0VXSNeBsRarLeA1QhP4Gc9nGgwl4omcgRaTruWdoV3a4eLZqHgpgx45enf3v8lD
	E400FlI5eRbI12lg0Pxf7h+wrCw2P8obN/hlY4D6lLp31xdDN
X-Received: by 2002:a05:6122:32cb:b0:55e:4bcb:6bca with SMTP id 71dfb90a1353d-56347fc9816mr3106314e0c.10.1767976943911;
        Fri, 09 Jan 2026 08:42:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtnDxUMtxUijRDlzqlFp61IGR9PYQbFmaTUisWeimfwTT5wuJtWjZKVJdLH/522O2LT6I2iA==
X-Received: by 2002:a05:6122:32cb:b0:55e:4bcb:6bca with SMTP id 71dfb90a1353d-56347fc9816mr3106299e0c.10.1767976943117;
        Fri, 09 Jan 2026 08:42:23 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:42:22 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:22 -0500
Subject: [PATCH 09/13] serial: pic32_uart: update include to use pic32.h
 from platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-9-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ujjrCeYW4Gws3dC552q2XCMpqxd2pU0ffvvLryV2FnY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y8+nfjb6YR/b+3VSf+kbk87EdP5xfCJ1+VZp2UkH
 +Z4J9Re7yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiprUM/6P/H35mMH/ugr7f
 +w6F5U6YKOLpLrD10eLdp/byTclOZJvH8Id7U3WNwIPS63NYA34acBlnvAkxert4U0WEe/ihK+v
 aznIDAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-serial@vger.kernel.org
---
 drivers/tty/serial/pic32_uart.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/serial/pic32_uart.c b/drivers/tty/serial/pic32_uart.c
index 14d50bd7f1bd3575e60e51783bf5b2d821f9168d..8407f85776c07a7495688fc4f95b8672b1543bd0 100644
--- a/drivers/tty/serial/pic32_uart.c
+++ b/drivers/tty/serial/pic32_uart.c
@@ -22,8 +22,7 @@
 #include <linux/tty_flip.h>
 #include <linux/serial_core.h>
 #include <linux/delay.h>
-
-#include <asm/mach-pic32/pic32.h>
+#include <linux/platform_data/pic32.h>
 
 /* UART name and device definitions */
 #define PIC32_DEV_NAME		"pic32-uart"

-- 
2.52.0


