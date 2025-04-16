Return-Path: <linux-mips+bounces-8611-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B449EA8AE9F
	for <lists+linux-mips@lfdr.de>; Wed, 16 Apr 2025 05:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32FA01901624
	for <lists+linux-mips@lfdr.de>; Wed, 16 Apr 2025 03:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4361F4635;
	Wed, 16 Apr 2025 03:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="DlzlSveh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C4E2DFA49;
	Wed, 16 Apr 2025 03:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744775357; cv=none; b=pEe3JtT48nve5qpDn17X5K0pP5IF/l6Yohwl/owG9MwoFvqvGNSSkDVKKXhCHzrMf5MS5ciilzjcBIf0KWZPhNf6Iv6s1eIaEtV4dOD8wEqEIWhK8t7s0Z4GSTEwUPtI8Mh0xdBSbJKs6mCtVcTYFq6w1mTVF3Hnp5qlBQOX8Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744775357; c=relaxed/simple;
	bh=72kNaEoJFUZL5dZZw8pv+GFtk1SKD6lHC7619kVBsdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=elh0YWDMfoMAmZKUiK3H7+Tn2lDNBB+cDTsffz1vYf2i57y3F2vstVzEoseUz1JunmxaH0bPzmsUqgZbrJ6F98K3G9lsq/XbhCwq2eWYo0Nt9gK+RU5r3lu9NqsvGc19NSRTpfO6u4SxKA7JyEt60zoTEFB/pNM0nf59e5tmEyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=DlzlSveh; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744775318;
	bh=sRE/NmB6AY8qA+aqCchSM3QNZ8JoxLXRhVx3KHBUcgo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=DlzlSvehYUNbwiwQeLrHJ2Mf5eAy6onbzXGtvWnf33lLxzyI4LQ0e1VSI/ir1YC6U
	 4Y0ZPYPhg2dhVXYuXaPMg5MixuxQY2hMiETESHsK+vFDuGdJCxzzROsx8ghDZcE3oB
	 OcjgpBfihbT8oxYddITxsC+GSRMkEg3YqtymMxk8=
X-QQ-mid: zesmtpip3t1744775274t39dec912
X-QQ-Originating-IP: 6Z6gzrNj5IQ3lDirIA9LsJZ9LdzKXqg2VesTeEtsCIA=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 16 Apr 2025 11:47:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13549914313903707969
EX-QQ-RecipientCnt: 14
From: WangYuli <wangyuli@uniontech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de
Cc: wangyuli@uniontech.com,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jiaxun.yang@flygoat.com,
	chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: [PATCH] MIPS: Loongson64: Add missing '#interrupt-cells' for loongson64c_ls7a
Date: Wed, 16 Apr 2025 11:45:48 +0800
Message-ID: <6E749D043BC7BD99+20250416034548.805069-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Nn1UX5BQtzc8h+RdnigxYQgaQjagILkmS3a5XRrsUz4Q0DsowSDGbkwC
	BymttjFN4AokWecu5dzAfKejb2zfaq/SuQ49zhy79sE1HiId42+MUtOe219xFJoXu58PtfC
	HOesbVJ9xh9qo2l+VbWZsfqXITfhoVHHb9J9bgUDP1J2UdptHJfSxlPO3qwjz8Lx42uxRsp
	Pzt/3yaVU6raS9B3UKQszwd0PMbG95NSKsw+bvN6qef55QUVYC+KmwBZm//Wtlrc6z9zzYW
	Lje575k0/x7Kdplm5TiKd0MtabgK+E3xyEuFtbEWYANoe/3fgMnMOt7JZwSx2un59ScBCM9
	QGEPIZan6Ky0Ze9izgEZpj6WPCnidJZEETkFPthpE0vNr4FgAeFm2usEgBQAnPVIlh9rqEp
	FTc+1Miixh5btecQ541woQhOEAAJjci4P6Vgvf4kFUf/7Wh1uvhJszMc52PddBbZpEWwska
	vle/o105n6SkXIGt/0RceVoZu4yTYdA6FmkBsGJeUldzlOnhQmuawTVqxcJJTOaM+cvGLJf
	McV3P49NVWVZhTFt2LeMsw7e5erTg3gkDa/kNcq5yjmyFBRVGNTmWkWBWSbbwHMNgpv0WBS
	7gBlgaA3UlfOnpcw43RQH5jBGaBS/x2NOxo+rDIgVr9f2pjo71LolkAo2FlcEWdk44n5Fou
	7povt/JYPTz8rlC/KFDOyj4uCw1jy+QMv7dwC2xA1oyzSM/BHtLfQEY+uet9z5LwEdaaUlh
	y6CH+h2eH+6B21UCjqM8BAWfv7usyvtDUE5Ma/7vRLjtXUJHLnOxns7tfVHp9VPcVJgsOCe
	FmpV7G3GIKPLlulo6XoZ1S4dJ9rkm9PMxE61jRNf8ci0wOcdg7HD2MPUP+0EW7E2T/Z0K1u
	eQM7X+N/MvLOg217BJlW7Ugd/U5HS+a/R/FSocc7OSvys1TDCi9xgrgxJOO7eNOqAQ7DVw3
	Ka0b0uvppHxyCEMmtR+ku5uifTNt7ClVJDyJTeZSyaZ5thO0+o0jf62L9q2aTdbod8qfIfh
	fMGUHJFQLiG0ug/skj
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Similar to commit 98a9e2ac3755 ("MIPS: Loongson64: DTS: Fix msi node for ls7a").

Fix follow warnings:
  arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4: Warning (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#interrupt-cells' in interrupt provider
  arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

Fixes: 24af105962c8 ("MIPS: Loongson64: DeviceTree for LS7A PCH")
Tested-by: WangYuli <wangyuli@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts b/arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts
index c7ea4f1c0bb2..6c277ab83d4b 100644
--- a/arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts
+++ b/arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts
@@ -29,6 +29,7 @@ msi: msi-controller@2ff00000 {
 		compatible = "loongson,pch-msi-1.0";
 		reg = <0 0x2ff00000 0 0x8>;
 		interrupt-controller;
+		#interrupt-cells = <1>;
 		msi-controller;
 		loongson,msi-base-vec = <64>;
 		loongson,msi-num-vecs = <64>;
-- 
2.49.0


