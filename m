Return-Path: <linux-mips+bounces-10329-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ECDB28178
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 16:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39163BA0697
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 14:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1967E21C9ED;
	Fri, 15 Aug 2025 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="JVi8WLPP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EBF21ABC8
	for <linux-mips@vger.kernel.org>; Fri, 15 Aug 2025 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755267489; cv=none; b=VabfVkNLH7VmGUP57kPz/zCLW99yquwnS6wbvmwDXJrp/vSPR4jUrrcWTgjsXy8XjkRbAvio8fB8iWMwqiijp/QHpw3si8+yCtJw08tFJLieH/d2wM0Ca+HaQPvbwRLuldMmyWPST8qk0I4OJLWQ7Q7l/e6q+XL/erfDwViHMnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755267489; c=relaxed/simple;
	bh=gb22G96UgMgP6kiSQT/XW6yIPv/GFoi8E3F+7hBpKco=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=QhldFbLtWix8jP9fwM6DYtPTapqg/U0jDiRhC4tcztZ0iQX82K9Y24BFPTToAEvaDIWgyHGEQURTp28VHeqSiE2M68Fp9Fu+u+f+H9xn6HHmhDqng2/VB8rBlYJLNwuPpBp5+48KHWRGDzHhxI+q3+z8Rx9dwL+AZE4nweF7Mq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=JVi8WLPP; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 10829 invoked from network); 15 Aug 2025 16:18:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755267482; bh=Q6jMKEa6BoWd+2xeRenu01SS+R4HqsisI3hjsomi4jM=;
          h=From:To:Subject;
          b=JVi8WLPPMMTT5EDjeK28MoVwNBIps2oRri4UCz6I4Yeaa63udvXGZ22iSbCBT/2wa
           Re0ADYVIuWrrorfnqJnvqJLgMWtmo8/QR6SxF3Kjr3v2A2/Y+ZAkfF1032fFWsJ1Ih
           D0QIfKRinFgyZhce5twzk0TLCuThl0Ty9CK2SMcrVEiXaKsVKn03FnDwdbxFbLH7U4
           HlGanMGdxw+MiG7zL0IfaJmasXXRsj/DR6upTLr7/r+lxyGv0FUglloi0X0UPtjeiv
           rdv3I3IAgWQYo8YyR26hn1gee2xGT5L9q7x3TkLCGnPc5+smoSQmH0xEwAgjMqsyB6
           Cxjk4iR4157kg==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <tsbogend@alpha.franken.de>; 15 Aug 2025 16:18:02 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	olek2@wp.pl,
	john@phrozen.org,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: mips: lantiq: ebu: add name pattern
Date: Fri, 15 Aug 2025 16:17:40 +0200
Message-ID: <20250815141759.3408909-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: a1f4c9dae71836cb19e0e4c1137d3f82
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [YdNE]                               

Lantiq target doesn't use Common clock Framework and requires strict
node names. This patch adds the name pattern to the binding.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
index 0fada1f085a9..c1f31084f793 100644
--- a/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
+++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
@@ -10,6 +10,9 @@ maintainers:
   - John Crispin <john@phrozen.org>
 
 properties:
+  $nodename:
+    pattern: "^ebu@[0-9a-f]+$"
+
   compatible:
     items:
       - enum:
-- 
2.47.2


