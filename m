Return-Path: <linux-mips+bounces-13648-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC5CG879tmkrLQEAu9opvQ
	(envelope-from <linux-mips+bounces-13648-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 19:43:26 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE60291F6D
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 19:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECC8C300BD91
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 18:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E998437B014;
	Sun, 15 Mar 2026 18:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b="yAYgKH6I"
X-Original-To: linux-mips@vger.kernel.org
Received: from va-2-37.ptr.blmpb.com (va-2-37.ptr.blmpb.com [209.127.231.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C5F37AA82
	for <linux-mips@vger.kernel.org>; Sun, 15 Mar 2026 18:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600192; cv=none; b=OCr+14rSnyWAuaHmfvHA/A3pEoQfXElW5V6N9E0851cxK1PzFvllHushkco8zQurAzgQqucIVKR7YzpwLhG8GFjkKzqLuxzkibjGeeN3bf+yNuhM5/C8YCnf7diIMbtSHCK9odTbn1AAioV19IR5RDiL7RYNlICh0dJcInicd90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600192; c=relaxed/simple;
	bh=w2pYQnYtLiqKwBffRtSb8vNS9JlcOpggD5JThpfVYKQ=;
	h=Date:Message-Id:To:From:Content-Type:Cc:Subject:Mime-Version; b=BLmRw42PE7IFIZ5GiI8xNEEgKNKvUVeQM5y8ER1hE37VPN/SqlXLUP+Py4n6Qky6MSSthwgVUuMxqWjk06Vxh79nxisSHUlzUVkuX3lNfQyDMD8Sh1zJmSlMJlY01gFAfRXSBd+k3EuuVjZfGDexhvfnFojJ9h9EyAq8iRNKdE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com; spf=pass smtp.mailfrom=oss.cipunited.com; dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b=yAYgKH6I; arc=none smtp.client-ip=209.127.231.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1773600185;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=KOqgapd8KUXSuICnVBWRXOREhupvrbnaMjU5ss2CqOc=;
 b=yAYgKH6ITrUikhbbyTQBxNSnPGDmK413Lzw+aotkiEqkVA/mscdicXdYWEvgFD7Gp/r1TH
 CxdvVN0HonBdBbBYklqmn6JAIcuza2eLMUnciRPMsGkn+hk6YhQykkUT9CSz6Arr0Fb55e
 plzotwpahrXLZ0KwO77pG9obPdazUhYD4KyiLBlLsNkJPS0etZSo5wdpfbEKu5ASzasseZ
 qp2gnJRH/ZhVmFPyqqjLAOdaNLvL/TGe+9yCV3Crg0dvALPMhloUFaC3ghVAVSwtA2ELsT
 1/iT9k7WpaB0dba7Mj77ABIj8UUr2kJDxOzEU2039WEnwDI50tcBR0Op2NSc+w==
Date: Mon, 16 Mar 2026 02:42:55 +0800
Message-Id: <20260315184301.412844-1-rongrong@oss.cipunited.com>
Content-Transfer-Encoding: 7bit
Received: from tb ([223.88.91.90]) by smtp.feishu.cn with ESMTPS; Mon, 16 Mar 2026 02:43:02 +0800
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, 
	"Jiri Slaby" <jirislaby@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, 
	"Huacai Chen" <chenhuacai@loongson.cn>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Cc: "Rong Zhang" <rongrong@oss.cipunited.com>, 
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>, 
	<linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	"Yao Zi" <me@ziyao.cc>, "Icenowy Zheng" <uwu@icenowy.me>, 
	"Rong Zhang" <i@rong.moe>
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
Subject: [PATCH v2 0/2] serial: 8250: loongson: Add support for MIPS-based Loongson 3A4000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+269b6fdb7+a05f43+vger.kernel.org+rongrong@oss.cipunited.com>
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oss.cipunited.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[oss.cipunited.com:s=feishu2303200042];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13648-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rongrong@oss.cipunited.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[oss.cipunited.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0CE60291F6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series targets the serial tree.

The UART controller on Loongson 3A4000 is compatible with Loongson
2K1500, which is NS16550A-compatible with an additional fractional
frequency divisor register.

Patch 1 adds loongson,ls3a4000-uart as compatible with
loongson,ls2k1500-uart.

Patch 2 enables building 8250_loongson (loongson-uart) on MIPS
Loongson64.

Tested on Loongson-LS3A4000-7A1000-NUC-SE with a 25MHz UART clock.
Without fractional frequency divisor, the actual baud rate was 111607
(25MHz / 16 / 14, measured value: 111545) and some USB-to-UART
converters couldn't work with it at all. With fractional frequency
divisor, the measured baud rate becomes 115207, which is quite accurate.

The patch for the MIPS tree to update the compatible strings in the
loongson64g-package DTS is sent separately, as it's independant of this
series and can be applied in any order (the compatible strings there
still contain "ns16550a", so no regression will be introduced).

Changes in v2:
- Separated from v1 (patch 1,2): https://lore.kernel.org/r/20260314234143.651298-1-rongrong@oss.cipunited.com/
(thanks Krzysztof Kozlowski)

Rong Zhang (2):
  dt-bindings: serial: 8250: Add Loongson 3A4000 uart compatible
  serial: 8250: loongson: Enable building on MIPS Loongson64

 Documentation/devicetree/bindings/serial/8250.yaml | 1 +
 drivers/tty/serial/8250/Kconfig                    | 9 +++++----
 2 files changed, 6 insertions(+), 4 deletions(-)


base-commit: 267594792a71018788af69e836c52e34bb8054af
-- 
2.53.0

