Return-Path: <linux-mips+bounces-3726-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED51290D6B6
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 17:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D9031F230D9
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 15:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139B11EB2C;
	Tue, 18 Jun 2024 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="FaBSxoqP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XoeTy9+A"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh8-smtp.messagingengine.com (wfhigh8-smtp.messagingengine.com [64.147.123.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFE21CD20;
	Tue, 18 Jun 2024 15:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723473; cv=none; b=Ik205GD4Axuy9ZSt7fcVotq+2ArBdx5Bmb1lDXioyjTW3h/ly320qVWfl+ntft532Ih6/yduo7YZ381MMe+EdMjGCRwRg9J5H0e5LUQled43gplgxcRvflIO5tWYufs3yEpQCvI8VCQBmKp3ll0JPgAlw78WhoFdaprpEU+fnMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723473; c=relaxed/simple;
	bh=K3N59nwNldSfgDAHXVnjWYBImxW4g56QyolpLFrZVFY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZfpbkW1QqvV3PtqAweB9ZgUUUx5mAxIatsqo5MtD/2RIsqTBEyDxsZlPPYhzNH+NCbtu2t5j4w99+fwFhI47ABWUV6ZXi5+l/Z8rfT4yB7HPFQ+iRRq1MiRs4g4BEMNZdvOCrd5GGuu2vioYGqNW/Jsv+nu/3digpLLuyq8+tMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=FaBSxoqP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XoeTy9+A; arc=none smtp.client-ip=64.147.123.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id 0EAA0180009E;
	Tue, 18 Jun 2024 11:11:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 18 Jun 2024 11:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1718723469; x=1718809869; bh=GS
	rBwu9bAC0f/uxRBDNmUvVdUkHdbVe6XDApK3YOq2Q=; b=FaBSxoqP1C9n5Xubfh
	pNPJAXlLeIG0GkBHqNBiz2cMUD/IBDN5zLVHWaLVW3nj4XnOHYMm2xQo6reVO04N
	FVMlMGMJP+oMZLPjXO/Q9x+Cpito6k4vhB3DIr84uUjZ7bcaT3M58lDeSRk4i1Sh
	QdIYyCMAHyTbBr9GMc1cvYpBcnJXO4BH+GpAMZ3CUar4Ojsv9+TbNvdnHPTdkvq9
	a4eQ8CHSfCm3M+FjxlFCiRIfY4a1uwxXM5R7SieYZBDaj8mAve85gk8TqzK56ZQz
	D36zEsmak9wikSTA2mA7SkdU1nZ/Wf/70FmPRlBgJz2r4rId634QTRysYHVS7Dy/
	H21w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1718723469; x=1718809869; bh=GSrBwu9bAC0f/
	uxRBDNmUvVdUkHdbVe6XDApK3YOq2Q=; b=XoeTy9+AcP7e7mKx1rKsMx6IJg6Lp
	jftbt7zftVAmQmGxoqhjjNTzpEg9HMnatQ0F7ycfId8Hnni+LjSmA1IcqiYNJ5sX
	2ZCNA2NwmHp1Lopz+hHFXCsHX3dxWgPcdzpfgAqCE30ymJ4wfsqKVHe6M8cDxa4K
	Y2kufMh6TjtTRV8jy+zg7eq16LCv5q4nCCFSjuG05sogXfwWxpNI/RvBt2IRqeZL
	sqAD/5uwVUlRS3XDxn5swH+IeRh6OpwXGyeJSDTMRb+YT6aAmNzhus8NJF7tWCSo
	45G/1lCCP2XcF/8maV2VB1NwhimLVOdiweJ0A0MwvpOW9Ls/NCHQlEc8Q==
X-ME-Sender: <xms:jaNxZhwD7IkSaruvcE0jUM7Olo7bSHshxv40KFnfXvkpFjceLSP2Fg>
    <xme:jaNxZhSXDjLnWcBnHqP3bGmSBHmXt4IqyTig0uaRuNOTgaIt_7P9vkNXjzf6fePFs
    RtOr6e4dgR_T6V3Z0s>
X-ME-Received: <xmr:jaNxZrWjwgH_vWQ6n8EVxC2fOMSQ_aofKd-5whzbGgbzHqY1tBSSkwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepgfevffejteegjeeflefgkeetleekhfeugfegvdeuueejkeejteek
    kedvfffffedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:jaNxZji-s8QVOUFT3-wQ-e8jq8i_LPFpBJndxCwShRCN1joU8OETrA>
    <xmx:jaNxZjASUmXHHK9jspscTrbx1kOoFZYtKXmmIsTpRztlYnbXpJ-06g>
    <xmx:jaNxZsJ6b8VhJbaSu6mULsmZ_FeQ4dyRi8dCKum2qfD51uO9cztABQ>
    <xmx:jaNxZiAiNxJ7s1mX21Xw-1gnnXvC2sZxH2H3KfNBK2QEBxvnlL1CqA>
    <xmx:jaNxZn6QISwSorhwN16ycAlEFoUQ0sRJu_BZNotl-UtwmVBMJaLyOTUz>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jun 2024 11:11:08 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 0/8] MIPS: Boston: Fix syscon devicetree binding and
 node
Date: Tue, 18 Jun 2024 16:11:00 +0100
Message-Id: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWjcWYC/3WMzQrCMBAGX6Xs2Uh+29ST7yEeYrtpA9pIUoKl9
 N1NehEFT8ss38wKEYPDCKdqhYDJReenDOJQQTeaaUDi+szAKZdUMUFuPs5+InGJXT4aBVPYSqN
 bCdl5BrTutfcu18yjy+uw7PnEyvdfKTFCSSusVarphZL6bO/L4M187PwDSivxj18z/uvz4luNz
 NDGmlp8+9u2vQGsPYmU7AAAAA==
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=K3N59nwNldSfgDAHXVnjWYBImxW4g56QyolpLFrZVFY=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTCxT3Rh6U5bTfxLMqzlOOevPDr6YNrlMrFTEscfv9kW
 +Q688qyjlIWBjEuBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZjI3WpGhjVfGtL8nCMjzgvM
 3LK1W7GuRvxVu6jiqmMeBhk+bCqSPgz/FKvVQpc+NuBntFjyiXWi4qEz4qtesFcwLjS/+mTF0jP
 GPAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Changes in v3:
- Drop CPU bindings in question
- See individual patches
- Link to v2: https://lore.kernel.org/r/20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com

Changes in v2:
- Write a new binding for this device (Krzysztof)
- Sweep other warnings
- Link to v1: https://lore.kernel.org/r/20240513-boston-syscon-v1-0-93ff557d3548@flygoat.com

---
Jiaxun Yang (8):
      MIPS: dts: Boston: Add simple-mfd compatible for syscon
      MIPS: dts: Boston: Move syscon-reboot node under syscon
      MIPS: dts: Boston: Rename clock node as clock-controller
      MIPS: dts: Boston: Remove unused #interrupt-cells
      MIPS: dts: Boston: Add model property
      MIPS: dts: Boston: Rename uart node
      dt-bindings: mfd: Add img,boston-platform-regs
      dt-bindings: mips: img: Add devices binding

 .../devicetree/bindings/clock/img,boston-clock.txt | 31 --------
 .../bindings/mfd/img,boston-platform-regs.yaml     | 74 +++++++++++++++++++
 .../devicetree/bindings/mips/img/devices.yaml      | 33 +++++++++
 .../bindings/mips/img/pistachio-marduk.txt         | 10 ---
 .../devicetree/bindings/mips/img/pistachio.txt     | 42 -----------
 .../devicetree/bindings/mips/img/xilfpga.txt       | 83 ----------------------
 arch/mips/boot/dts/img/boston.dts                  | 25 ++++---
 7 files changed, 119 insertions(+), 179 deletions(-)
---
base-commit: 6ba6c795dc73c22ce2c86006f17c4aa802db2a60
change-id: 20240513-boston-syscon-8e315e94a894

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


