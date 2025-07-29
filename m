Return-Path: <linux-mips+bounces-9934-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDD6B1547E
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jul 2025 22:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D86785A0D8A
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jul 2025 20:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7BE279347;
	Tue, 29 Jul 2025 20:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="kNenJpuu"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9FE267B12;
	Tue, 29 Jul 2025 20:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753822765; cv=none; b=OAC1ceDLFyiLn2CxBt3FTaCu5uj8YresAKVcZsWEeN+qoG10s29M49ncPGfH4Ruy1tl+DlcjQpzLL7a862+fMcCfyZ4Y0DyLWDFgdn+uZTjzX32iN4QbR+BeASWUeSH0OS0BcHmJwsaBzdVsujg9IX9zRbjwrYeXYBuw1U7+DTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753822765; c=relaxed/simple;
	bh=IKDUD/Kptz7+IbPpIAAK6wTe6FFm5ZQYQNDSXdWrdSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A+Tqc5bB5ZdVAfFIfYTgzekiVxuhR4WGIiwMPy20l5hgh5JyhcZI/DQPr9VNc4TIWCN30RstyPhSzwWfhwOb+egawol7khnKFDGbx/QWc0Z4QDL0dWIC6CHVZM2URChaZxSqdxrn8hz0g+p0a/BXRNw+o0xkwRVLwxGcAymdhSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=kNenJpuu; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E424FC0000DD;
	Tue, 29 Jul 2025 13:52:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E424FC0000DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1753822353;
	bh=IKDUD/Kptz7+IbPpIAAK6wTe6FFm5ZQYQNDSXdWrdSE=;
	h=From:To:Cc:Subject:Date:From;
	b=kNenJpuuzuy1/PBLn0Wq6B2HVE34i9o8JJUOzR54Nf+FbyUS4hz4M9hQxf/KhGtgZ
	 ywESyr3CV+m6WGCK7w0WY0qc2NR11KGAsWoETkd785/YWyu5udcAE+kaUz/2jRd8+t
	 csnbhcl0EszoSxVKEjiaD3/BBiRynHejKuP3+AKU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id B4EE6180004FC;
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
Subject: [PATCH 0/2] brcmstb-memc-ddr binding updates for MIPS boards
Date: Tue, 29 Jul 2025 13:52:11 -0700
Message-ID: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series updates the MIPS-based Broadcom STB chips to use a
proper compatible string for their memory controller node(s) after
501be7cecec9 ("dt-bindings: memory-controller: Define fallback
compatible").

Florian Fainelli (2):
  dt-bindings: memory: Update brcmstb-memc-ddr binding with older chips
  MIPS: BMIPS: Properly define memory controller compatible

 .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml  | 4 ++++
 arch/mips/boot/dts/brcm/bcm7346.dtsi                        | 3 ++-
 arch/mips/boot/dts/brcm/bcm7360.dtsi                        | 3 ++-
 arch/mips/boot/dts/brcm/bcm7362.dtsi                        | 3 ++-
 arch/mips/boot/dts/brcm/bcm7425.dtsi                        | 6 ++++--
 arch/mips/boot/dts/brcm/bcm7435.dtsi                        | 6 ++++--
 6 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.43.0


