Return-Path: <linux-mips+bounces-10294-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9AB26143
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 11:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 315AC188C091
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 09:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036B82F3C3C;
	Thu, 14 Aug 2025 09:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="JoAkYahM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5443B2F1FFD
	for <linux-mips@vger.kernel.org>; Thu, 14 Aug 2025 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164242; cv=none; b=O8aMygqH+JAvhmZKmLCp2OWbnQDZp4IarzbpB4sWlJVD7I8gHR1c1qo92bHUXI0NOeckCf4ce+cSQ/hqKwf0wEua0hHlsKU900oVWF7AamrzpadzH/+RyAYt9QJHHlGAO/kqZLLQl0NVoqxqxeD5ScNffQn7uGnEVK+m2GnTWEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164242; c=relaxed/simple;
	bh=U2iAQMp4g0ZN39jsnM57rlfE8KcHOoYwzBM20ZK5y14=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=juRf8hQEIrnmCfjEpW97/al5FVTtTeI3En1eUTr1/wzmEcFCZJlAy0/AGDAgKxB0CqxXlVJwjfVSL9+1nCPAXXku31h8zy9R004VC4PM8Z6GQRaweksY6X+L7hpLsKZpfHlrMCGa9mi4q00aWIbkXP9jNSFJbiN5ozt7Z7rJauo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=JoAkYahM; arc=none smtp.client-ip=212.77.101.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 44156 invoked from network); 14 Aug 2025 11:37:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755164238; bh=afbiCjV80weq/eiM1cMoltt+x6GiJ4VsyS8QO5eA2D8=;
          h=From:To:Subject;
          b=JoAkYahMZVe1grtUA5+j0clKtNV36E6KL9M8YesDCSU+if+BeToKUqrUCN2Zeb/Ve
           sriRqqdo7i0VqBypc/DZJGZfPhUdwVeF+wm290vtiuwVpScvUSouJaOojtGTOiTZVn
           A8nFohTtap7S4hEOpv3eITZP0NkWVz8sgiKNKEnU43BDW+AHBeqIc8zize1uNfjq9N
           gEJ0z8TG8SxyVNTrlqBtpCJFBtEP5VBMdn/HkWiqhEhiaTNv6aYbgQF1MqzJr74Brz
           darGaN9BxHSdqkYCL06D0CslTkvOK4+VjbsRtdczrEZNwNkflIwfKqS0DqOMOUOvk6
           vreScAB+F0DXQ==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <tsbogend@alpha.franken.de>; 14 Aug 2025 11:37:18 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	olek2@wp.pl,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mips: lantiq: danube: add missing timer interrupts
Date: Thu, 14 Aug 2025 11:37:00 +0200
Message-ID: <20250814093704.3197030-2-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250814093704.3197030-1-olek2@wp.pl>
References: <20250814093704.3197030-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 037b4bee9050fa9c7e688cfbea2e5690
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [wRNB]                               

The driver expects six interrupt lines to be specified.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/mips/boot/dts/lantiq/danube.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/boot/dts/lantiq/danube.dtsi b/arch/mips/boot/dts/lantiq/danube.dtsi
index 7a7ba66aa534..371d06d1a225 100644
--- a/arch/mips/boot/dts/lantiq/danube.dtsi
+++ b/arch/mips/boot/dts/lantiq/danube.dtsi
@@ -71,6 +71,8 @@ fpi@10000000 {
 		gptu@e100a00 {
 			compatible = "lantiq,gptu-xway";
 			reg = <0xe100a00 0x100>;
+			interrupt-parent = <&icu0>;
+			interrupts = <126 127 128 129 130 131>;
 		};
 
 		serial@e100c00 {
-- 
2.47.2


