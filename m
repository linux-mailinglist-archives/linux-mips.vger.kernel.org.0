Return-Path: <linux-mips+bounces-12881-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 690E7D15AA3
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 23:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F54E30D281D
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 22:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8923446A7;
	Mon, 12 Jan 2026 22:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UPJu6o9Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uCwoRCDs"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF5E2C0F6D
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768258154; cv=none; b=mFfwE1PUomgFdMtp9dYK2GkQC6pyBzkHYzs5c6qA8Tn6POl9PT1eJMdWkQPUuSCqKuoIV1Y0Mxi0GL7DmO42byFZl/aFAZnzKUTVnL+N4KMXIMPLOAiRRS3m9+ucSK/0i6y0jV9gwdcwOOX9cyPoVBMSYfOE5JXr4h3vO4NgiMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768258154; c=relaxed/simple;
	bh=ujjrCeYW4Gws3dC552q2XCMpqxd2pU0ffvvLryV2FnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFgeCjx03ExJ/tmm/p9V6k0jQCH0ROS0bGK6isnkIZ79knJJGVUoRaDo1YAHv0N1tmEQxufLQ1NMfVWhKrAZzGBiX+fhCJD/uZVzmnKLhnYh7kKeOVn5a+uOLfzvE25fLLwHMNImMixgCS+osF7hIqAKWNyB2JjpmZo8uzHMavo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UPJu6o9Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uCwoRCDs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768258146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xPVVsDO6rA1DUsYXI1T3bEgIhuRr3/ZOG3IZ44Wx0sU=;
	b=UPJu6o9YDEUWMzcSDQx9qtc8/LhRBs9mvTHGWtuyNdsLrGBpuVJrC2On09SuQvbAp8Mb0g
	ujTlUUqeVWSNlRHzy0JO9zWehoSKkC2R7z2m4mARXDXCZkH9CntOeW/Aaj78XdRYVn5Cnu
	Mklsctr+f7Sa7PKicG6yxv4y7fCokyQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-RsHR3zVlNEqVhqabAUlgag-1; Mon, 12 Jan 2026 17:49:05 -0500
X-MC-Unique: RsHR3zVlNEqVhqabAUlgag-1
X-Mimecast-MFC-AGG-ID: RsHR3zVlNEqVhqabAUlgag_1768258145
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e19c8558so379339685a.2
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 14:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768258145; x=1768862945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPVVsDO6rA1DUsYXI1T3bEgIhuRr3/ZOG3IZ44Wx0sU=;
        b=uCwoRCDsm4DNYgVvCrkY2lkxZGUOJPj688VrhtVoyIjAvAZR016BY0aUpcnvebCuGi
         c7KYDHJ59upTHFrpOsTyKyBfWENWewEFM7oyjou7yOCBR8DEUZpUl9Ua7UjRS19YtKHk
         l7RdAgx5+1Pl7nJI6zWMFfz+BUtQSiHKdwDV0lSilAlUYlry6BXDc5ZfucplXB6P45TD
         W75QX3WoepNsirOjmoJAv4Nr7ujYYltvQsOsw/DXZQQZnwooKbix0BKw6skKz/0+tshu
         rwbtCmPLrpkc8A6lNK6ouYg2ZHCV8EHtq4sRYDOgy3m1A7r/W374P2ZeDXmqed2a3Cks
         KRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768258145; x=1768862945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xPVVsDO6rA1DUsYXI1T3bEgIhuRr3/ZOG3IZ44Wx0sU=;
        b=KsB9w+ORARefxnQU6IsMPOw0LD1ouqYIeCe6XGWuJly0m7gGeFoIfE14NG9Bo6qP1V
         H1TyR0p8UUiSNmKDM/KaQhXdvLHI/2JQ96uuUeoLwyPTTfDyW0RrtMKoBmpU/t7t8W1y
         W22i8tybIX7IafT1fpjfel3yjpTt0D09SpTN95nDWM81J1fQXurUbNxsRykUOYhnGcea
         RPuMheyPQ/oBVPZnR2oCzmb5uNkTyrnIzFLZswoskv0/6qdBiwpp0D/gOhcZFZ2S3fqC
         RV1lYcGK7u+j+xSpNPJAAJnDaNaGz+xDbxalyADl49Dw/udbnFyaAA0m+eYE3GTK5xj7
         Ne/Q==
X-Gm-Message-State: AOJu0YykXFBqZPit+C1x48fpQdK2vFOqZ/kKyx5iKqRbWhETnivFm8os
	eHrpg/m7ylpOLfDwncBAZdhBz5gpy56BY9ufOyScT8hG81pT3CQAgnHRcJTtQvNSvZwe7tLsGUu
	GQ+MfkvhkT6jAVja3UJh+TGO08vtsmpXO6pQ1j/Mk4GMWPjF45x7mIFVw65ryMhI=
X-Gm-Gg: AY/fxX4ha352xmuyYHJmausdoxtPw2q89dH/8zGSZ09pfXI3SpgsRrM0it2dJidKI4c
	SPugVC3uPYKxgnDpQgqoRNjDaM3+dqNzNNClpUe1lXMU2+FwszLSMJxojEKISz4Tv2I611OyqAg
	9FBEAUe85nb93Iym5aK/6sQx4XeSPnu453+tF7c1P3BAW/4tYETO33Er9IGEynDS3WutH4/9iIs
	j3Iolq7MyLbp0K3Vf763OaNRIe7DMhpYjv15sItAaitrbe36SRhKnBNfKoAZIfxVimvXHdHXyvQ
	F1Uf2CpHvOdHv2j6I4jfYbULFotXJcG1Z4QFq9kohgsE0GWHoDlEKc2SpPUmV3riBcQF/E0Bx0w
	EKt+kWSzkuEjrcWYayV6PGjg2nWCaaBxi8/3bULAvw/E8igZeeQ==
X-Received: by 2002:a05:620a:191d:b0:8bb:ac44:bd34 with SMTP id af79cd13be357-8c389368d86mr2436419985a.4.1768258145064;
        Mon, 12 Jan 2026 14:49:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNXCc8z9qIgmtoPJLDZiBaHPvREI5QKz6xqckNeA02fMmWIrp28+uV08fFzeeVnlq/j5MHQw==
X-Received: by 2002:a05:620a:191d:b0:8bb:ac44:bd34 with SMTP id af79cd13be357-8c389368d86mr2436418085a.4.1768258144624;
        Mon, 12 Jan 2026 14:49:04 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a6145sm1580930385a.5.2026.01.12.14.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:49:04 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 12 Jan 2026 17:48:06 -0500
Subject: [PATCH v2 12/16] serial: pic32_uart: update include to use pic32.h
 from platform_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mips-pic32-header-move-v2-12-927d516b1ff9@redhat.com>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
In-Reply-To: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
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
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJTq3xSvDvZXIseCG8/w7I1cUdP3sV3++582GLI+WOu0
 v6IW88rOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIQVNGhpcPaxNz/7ac/Xzk
 OdPLhcZ2u9Y3OPZ+N4pffEFq3iX9f1IM/9Put6XPv/nbMz9jqeFny70FDT8Wi/a66mgGdjdYtl2
 VZQYA
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


