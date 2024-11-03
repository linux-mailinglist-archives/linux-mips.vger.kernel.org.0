Return-Path: <linux-mips+bounces-6624-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAEA9BA588
	for <lists+linux-mips@lfdr.de>; Sun,  3 Nov 2024 14:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62B30B21B1F
	for <lists+linux-mips@lfdr.de>; Sun,  3 Nov 2024 13:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB9B175D37;
	Sun,  3 Nov 2024 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Q3Ikl0D6"
X-Original-To: linux-mips@vger.kernel.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8A917333D;
	Sun,  3 Nov 2024 13:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730639068; cv=none; b=aVUv76g8bzfXGj/50So1zI92S+yDOMW+TFgbtd+BX3zvcad2EymRTBs1ZAnM2FhJ+AFgzUrB+ZVCI/LxQtBDvRM39ko54gg2BHFoXG9DXtPZ7EeEMaTU7vodh1c1+kKhN570E+2kyGa5x+1wsgavLtIoP/KrAcHUqIh/VQswDLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730639068; c=relaxed/simple;
	bh=ODJroqZj1uoighLdkdsPQQeYCsIVdSL6P/2DhfeKrS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jtdabaX400lJf7nge1FiPJ+oGktPaPzXF0kbFOa9BYcnj4yVDPuJUgCHirc29UqRffVGbxj1hd3MiXKQGB2f8WPPy8Nw8LwZDSRV/yypm2vgd/4mAxd408zrE31G5ga7KOBO2NBvDD8Ia5hvKXERzZA0fXUFnViyPAJrL8AT4gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Q3Ikl0D6; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1730638914;
	bh=uRk01ZwI+/XBmQqQYE25XRQ/hWGGUvmspCgkKFpABU0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Q3Ikl0D6X3z0kc/MdUDq6Fa7mN1/W2DPER6AJe+ArF+VEmew3m/3gi43dZQTRM4D8
	 gNgTSs6ggSgluhttvrMQfRaDjN5SV0o+7nlPhWOdOtMLFFlnPHzGe9NyCxATQE67jY
	 df+JTa0pq668fE0Xkm/iz3UXlCPXgD0AyBPtwFUY=
X-QQ-mid: bizesmtpip4t1730638859trvs6a5
X-QQ-Originating-IP: y9tNHnU1Lp8NnZXvgBoRGehnl20jiKdBdFrs5GtSrik=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 03 Nov 2024 21:00:58 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7277173148730909127
From: WangYuli <wangyuli@uniontech.com>
To: tsbogend@alpha.franken.de,
	wangyuli@uniontech.com,
	dhowells@redhat.com,
	jlayton@kernel.org
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	jiaxun.yang@flygoat.com,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	xuerpeng@uniontech.com,
	maqianga@uniontech.com,
	baimingcong@uniontech.com
Subject: [PATCH 2/2] MIPS: loongson3_defconfig: Enable blk_dev_nvme by default
Date: Sun,  3 Nov 2024 21:00:05 +0800
Message-ID: <F56016A1645609BF+5d1de4afc8ee6bacf8878461b848de72b556c85f.1730638429.git.wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730638429.git.wangyuli@uniontech.com>
References: <cover.1730638429.git.wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NDNaZgy3Og6A0GzPyTs2JGuO1Po2hiZtI1fZRMiWkK38wG8V5gNBXI3d
	P8wVLZ6iuSMhx6fA7WVN5zFe2le/bMUtXvbTSZtEoK1LzlrXOeFTFqut7QyGfIHn0ovr5ih
	RNLWjWY2E/5vUwdDgUTvt4k0gatn3yDxraJZYDRJEjyxlphlDLL8Y3vTucaaBTCUIIOA0c3
	JH2p/UqbQ5ilLqn9yTMKI9S/19bUbVtUy3Yxmbw9G9E3Rrlx8Ht91VQ2OLziidCbIy3pXB9
	7ZXzplGJhucCy78+WuWYwNDrVbW9cM7mUsFTDLrR+1dJkYmpMRlHWFI1TJ+qiB9WA1HjvHd
	oAIG1VKWtbJMBXUZUZHU8vxgrd0DEv6cq5ETGPsursesJ3JPCElhYxSm++9avsaMRPE9nEa
	JV39esNHkfD4QPHOuwSQ7X6/eZYtKcgGMbtRWpf6HQ9b5rsfR6GYjjXSIWxoJ6LptYdDZNO
	J4K0Obvcj9Xr/6GIHAAGizi8lsjQDfpMvJL5pUoZDHOsVHISml2UQcTC0lG95iMc64RWI5U
	WO6NBW9dYZv5WbtkF9mVR+P8V2fsYh3NMpHDwSM5wsE6XlaPBKF5J5LcPeO2iEouS8FHA3i
	rADJIwExyHHtOtaiJCn4y0ldPSp99h3o83lCMKbaG3q3qHIvYhl9yZhVdAGjqMq5L68mtdP
	MXZk5QRie0vNjcfBU25nhkR3gch9EVZId7TlYbpw71rNhajq2G2b9TzZdU9+fjDsRrgxC91
	kOcGhmU79eB8x4aSZblZqWtZfqlpgvei2ngqN/IhqusBnjOsGaIO+Dvd04XFk+zataxJaSu
	BEObPs0XpKGCTSjLow0SpJmISTFCqMEgYN8mHXgdqAiZZVK8CewfPtB6n3AsftJ7Sv6RhuM
	xxtdZVX5mR7er7mJ9iQCuPuM2p2tsUhQrK7n09+GDLDSOx6YzK7/Spz/8iyE6jhPOEuE8pu
	k7e9k6N2yROd0u32DeTiHaxYfGgo/vOY2W+dDanVdEtgi1iX2nHEhfhBshK3+cCP0ci/aYA
	LjfNH5KRWQJtMh1Mn+jE0YqtDZFOPldWkiVi+FKQOC1H48nVYDVoln76kPCDCT1KI75SApC
	g==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

A significant number of 3A4000 machines come with NVMe drives
pre-installed, so we should support it in its defconfig.

Tested-by: Erpeng Xu <xuerpeng@uniontech.com>
Tested-by: Qiang Ma <maqianga@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/configs/loongson3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 30837f3b6acd..98844b457b7f 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -141,6 +141,7 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
 CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_NVME=m
 CONFIG_RAID_ATTRS=m
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
-- 
2.45.2


