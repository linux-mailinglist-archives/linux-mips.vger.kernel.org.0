Return-Path: <linux-mips+bounces-8506-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AF1A7D653
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 09:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46F3A1893AEE
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 07:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C253225A48;
	Mon,  7 Apr 2025 07:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="QFVzwYkU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A10185920;
	Mon,  7 Apr 2025 07:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011476; cv=none; b=uYWej8cFamAB0wh1/DzgCmV2XLv3dp8OeUFVZ/DcCVnptHZodnDBibcAJUo/ZpG5dP2t19237jNh4pM7uqXU3/+REhCzROngSXkGLfyNDmRphSqHQJ55IbpbrKf3hTeGoqmdnb/jzrBNE+5h80d9kFs4xfat5/SRKnpYJlzoggQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011476; c=relaxed/simple;
	bh=niHZ7SywtqEBXhJxXUoQ5qHTD9B3hV3qxTLETfQVkRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/8WSM/d8CNTmYjzQi0qMu7znQ2pQ4k8PiN7mnbkdS+ktU+zq8QR2NitkdZyYNh19/cbXbay/7/xBXXWxnJrs2HlHAOco2SqBmIn3x1Yg9HLbAjvUIouZRo2YVn1KNQvstyA75/VqA9IMT631HDLVyWp6d+vBHyhRkCZPyZ2NRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=QFVzwYkU; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744011464;
	bh=TTsZEPwrBCz/1dlJoPGkzqJ2iCyPoKODASZBVNBm63g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=QFVzwYkUp7/0YXmOYc77Vw8VUAHv9K8Lx3nN4iGtvZGq4aAZILNNy0c0hnwTs3PG6
	 IcA68dp9k7YDdUPCJRhPyc11/AhSL4u0JgE/mjmfM5kpQP8UaxQGgIGUKIZuVSjQUw
	 eO9XMaG/2DGkGe1usKz4uWfFagGkCqj0+12K99X8=
X-QQ-mid: bizesmtpip3t1744011421t80f82c
X-QQ-Originating-IP: vgyjA3JwGgo1td1m2zDCHvAGGPVP7//IjViELQggqP4=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Apr 2025 15:36:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14365369474605265875
EX-QQ-RecipientCnt: 8
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	niecheng1@uniontech.com,
	tsbogend@alpha.franken.de,
	zhanjun@uniontech.com
Subject: [PATCH 6/6] MIPS: decstation_64_defconfig: Compile the kernel with warnings as errors
Date: Mon,  7 Apr 2025 15:36:22 +0800
Message-ID: <58DFBC3D4C9FC64F+20250407073622.495364-6-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com>
References: <11740B01E659CAFF+20250407073158.493183-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OJo9j87u+UJVCsaUKG/0nTaU5/jP2VtUE+olkX6buirH77Wv24pxC0cW
	rYFgCC34Y3HPJt/2D9Gllvb5BdKpkWazLvGvyAVKD0CLxZNOtj+BeQCOSDbwm3BDZ937BuB
	hQ8m9M+Pks0Ji1EOQVH59Mhoq+tljb8EGHNSbMwAtF4z55bt0ZZ8kdfdIZeo2VLiYs/lTMx
	vJoha+o7hnRsv2g0ravgtgT+6AgjAmLnpI/09VsldkvBehRlhvOsT5avrGZUfHiNoOx/jR3
	s7CkE5lLDhFrXHFgt+Ii/6FdD+wknI/EksD0LTUKXgVU8U7RreObh9DNmU1gRlpWNRp+5WQ
	wl0yRwx7oxNFwRgc7U3huynJMq0ved4L9aAIgK8oxTF3QqudiHi85Dqpfs42JViQ52T6JWI
	XZuGSDdQjy5LK3G3SnWlloTiLrMgKgJ3zl1DH6LEEP1IZbhRKGFeJIdiCNrXIk59QbJpaqg
	elhnyEiLsoLa2Vspqeae8m0JNl+Uf9DtIEWcLauOGdS0fgrgOqhAx/VdVfSURpL+UXrBANd
	RJozj47EC13SjpzBKIkuzWuBwNkuBH5MOidUY5Dq9KZnY64+B5cTUcbsEBNb+CjsuekEp4V
	xGYYXkF+LAa7nXUP3krmF6qG4y2UOOxTui8UMJ0W2flEV3lEIr9rTtAxLI6It4cJBlMEoke
	+Ft9CQaGWSJXhZ5iLv/IBbZVh7oKoWXfKOF7G9qDes0laO9dmq4X6TugdfC8F9mMMI40XSy
	gaup/AQOK2sK58OET7ohNQDAR+0k/o1X6XMLkxK1ph1L+RPThE5yJ4MrAF5Xv1WwyAgwT1p
	2ca9JR7upJ4NItpqT9Oey9M3o0NQkXm46rQoW5CCSdiTOKqKuVyYD4qdE/cOb+CfX59MfCW
	cDSepUOFHU0roWWl2UBRq8HgIzToUHXSVMY5MOG46Dp7prZ6mAOgDUZxCXgLJKwlls7bBhK
	Cqk/6fLk3goH+wnJkzJ0kyV2lK+edSUZ8GBw4SdZI9ZdPQ7UIFjVva6lLW410M89fArSmmg
	iuav88DFQvhqG4anbohRiPi7ZkIg4=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

All compilation issues under decstation_64_defconfig have been
resolved, and it is now safe to enable CONFIG_WERROR now.

Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/configs/decstation_64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/decstation_64_defconfig b/arch/mips/configs/decstation_64_defconfig
index bf579866cf4b..12415c5dd28c 100644
--- a/arch/mips/configs/decstation_64_defconfig
+++ b/arch/mips/configs/decstation_64_defconfig
@@ -1,3 +1,4 @@
+CONFIG_WERROR=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
 CONFIG_HIGH_RES_TIMERS=y
-- 
2.49.0


