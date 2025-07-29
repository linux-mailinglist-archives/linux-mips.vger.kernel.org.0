Return-Path: <linux-mips+bounces-9933-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26509B1547A
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jul 2025 22:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F9F056067F
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jul 2025 20:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F8A272E4E;
	Tue, 29 Jul 2025 20:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ME5Xm7qt"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04547221FA1;
	Tue, 29 Jul 2025 20:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753822750; cv=none; b=TYSYWDXb0TcptliDQVJVbrA3tS1V2KW3dw31lDWn9VszHjfsYKuWgxBrjLm4AboTWyt/FDR0BryNZsiG6SuRBd9AGUFnsBXclvuuxOUb34m4jFcrfgCXOhUM7BSuxL3zNwfOqpTGI01pyZ6u7PjJPLNy8tTYZjgvUmQ/OvlXY8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753822750; c=relaxed/simple;
	bh=B1GjCFdZePkk9UeGd4mGcZnBu7IW/DNI7O5djpAHT7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jO4OSCg4XLlwkPaqGSt0zjx0BoDbMkrdG8n/+JB0ddw3KW0bOkDblwyXYu81NmGm5WenD2JZKJHZyEAdCKsVaeYUBW9IC/+mPcYZMRoKYomMyf5QHnFtWzyRsIjxgCjTXlyNyPlZ8Yz91rjnj7rzoFmkxZHXQoyicWGTVPaApa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ME5Xm7qt; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 494CBC0003CF;
	Tue, 29 Jul 2025 13:52:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 494CBC0003CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1753822354;
	bh=B1GjCFdZePkk9UeGd4mGcZnBu7IW/DNI7O5djpAHT7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ME5Xm7qtzSSjI/wyYZ/tli8EyollOzuxwlI3CUnhMrSbomUzS9l0aQfTsWYvvSUkD
	 1vi7xS78ZwqXqpUdE49XiAh+xV3Q+V0NTLWE3OsWvCyyZHAiSD3lzbAnUvts5+0XMo
	 Wh5tGyeKsKBXkfwevP9moX2iEKIJccp1u4q6jETo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E42C018000A61;
	Tue, 29 Jul 2025 13:52:33 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 1/2] dt-bindings: memory: Update brcmstb-memc-ddr binding with older chips
Date: Tue, 29 Jul 2025 13:52:12 -0700
Message-ID: <20250729205213.3392481-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
References: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The older MIPS-based chips incorporated a memory controller with the
revision A.0.0, update the binding to list that compatible.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
index b935894bd4fc..3328c8df8190 100644
--- a/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml
@@ -42,6 +42,10 @@ properties:
         items:
           - const: brcm,brcmstb-memc-ddr-rev-b.1.x
           - const: brcm,brcmstb-memc-ddr
+      - description: Revision 0.x controllers
+        items:
+          - const: brcm,brcmstb-memc-ddr-rev-a.0.0
+          - const: brcm,brcmstb-memc-ddr
 
   reg:
     maxItems: 1
-- 
2.43.0


