Return-Path: <linux-mips+bounces-7519-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A8DA1638A
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 19:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 011203A5CFC
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 18:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FB11DFD99;
	Sun, 19 Jan 2025 18:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="dS5Z4bQH"
X-Original-To: linux-mips@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D2A1DF74E
	for <linux-mips@vger.kernel.org>; Sun, 19 Jan 2025 18:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737311702; cv=none; b=pK/0fm7CFyyQgNBXVQSt809fBhSNo0jn/VF8Ka9iOMv8P0JTLYkAOe2FgDGve2UZFtFWATkE/T8km8vQoyP2chgqxDeBoNCYJcLtpcutyZqn3DCFNCEqnfPzDtQbMwYswW5ORIq2KiMgBcK0INJP+eM7YXWAbV1c+4el4qDOHQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737311702; c=relaxed/simple;
	bh=W8gkY/oB2mZcEQ3l5zYkHT2kMm97aDKy3B5Vf1lOxtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MndyDKMoPM6zRbLDLzGYzUQh/RA/MZdn0Sve+Fl8OWAMTm6G/ndjvvh6L9cCHeq7MOmKbYdlRKpJHrYzKNP7CxPijuaoH4Sm0yoJdLji0RMIifOcvuv6Tt0RYEK9N0mD/A/Oq97FwCcUJUGqLo824psBEZo2gsFemlwdTU7YJOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=dS5Z4bQH; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (unknown [94.110.49.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 1BE145A7E52;
	Sun, 19 Jan 2025 19:34:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1737311693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aTURxDbV63Zjs2S/DRfXH2c9HmUmHuIZtKJs8r7hlnU=;
	b=dS5Z4bQHMmNu8SU4Jcu7hPtJlds+Ez/lasBY1G2KkjKh37I6j2EG8sGndz3j11XesCYl8n
	d0Cu5W21392dOaEDwRLMZZ4FZijI1UkVZdY1BALLy2LKOhMFE8rWB5tU6bSzigCo4l6S2+
	7hFcIOTim8D0tTGYq192j05KM1fhVuhbcU8rmlBBQ9qw4ZXOKGjBpr7S3N3R8h82h5I0j0
	IzZA7lTRec1UryBqgbIRXgZ+IDA70uAo4zlhv4TvVNlLEV4Qr4/4zuTy8uxL2LfDaF+tV9
	O9FvDfpGmKmp/DxsZwQ28NYwtcMyWvCjKd0jspgQe+KKqdyhf3O9YBbCFHIT4g==
From: Sander Vanheule <sander@svanheule.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH 6/9] mips: dts: realtek: Correct uart interrupt-parent
Date: Sun, 19 Jan 2025 19:34:21 +0100
Message-ID: <20250119183424.259353-7-sander@svanheule.net>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119183424.259353-1-sander@svanheule.net>
References: <20250119183424.259353-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uart interrupts on RTL838x chips do not lead to the CPU's interrupt
controller directly, but passes via the SoC interrupt controller. Update
the interrupt-parent property to fix this.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 arch/mips/boot/dts/realtek/rtl838x.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/realtek/rtl838x.dtsi b/arch/mips/boot/dts/realtek/rtl838x.dtsi
index 21fb584e6383..e3183a71765e 100644
--- a/arch/mips/boot/dts/realtek/rtl838x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl838x.dtsi
@@ -46,7 +46,7 @@ uart0: serial@2000 {
 
 			clock-frequency = <200000000>;
 
-			interrupt-parent = <&cpuintc>;
+			interrupt-parent = <&intc>;
 			interrupts = <31>;
 
 			reg-io-width = <1>;
@@ -63,7 +63,7 @@ uart1: serial@2100 {
 
 			clock-frequency = <200000000>;
 
-			interrupt-parent = <&cpuintc>;
+			interrupt-parent = <&intc>;
 			interrupts = <30>;
 
 			reg-io-width = <1>;
-- 
2.48.1


