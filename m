Return-Path: <linux-mips+bounces-13640-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCFxCWrytWl87QAAu9opvQ
	(envelope-from <linux-mips+bounces-13640-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 00:42:34 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F51028F8B8
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 00:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 600BA3067428
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 23:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59D434EEE8;
	Sat, 14 Mar 2026 23:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b="2HP/y21E"
X-Original-To: linux-mips@vger.kernel.org
Received: from sg-1-17.ptr.blmpb.com (sg-1-17.ptr.blmpb.com [118.26.132.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437462ED15D
	for <linux-mips@vger.kernel.org>; Sat, 14 Mar 2026 23:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773531751; cv=none; b=nCI4pqXD8tVYZ/G9ep7KIsJ3L3Y7C4pU0PfLJqZ2OPjtIRrLVq/h5STw7ahJE+YCoFSLqt07yCTCB+IzdAjAdyrL4d7nW1cik6uPXhBqHRwcbPVmMtUgjEKeHGTrEns5dQ/4o6QqZvZXXv+4zfoUh+J3qeDyyMn7Tgjf24KWre8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773531751; c=relaxed/simple;
	bh=vrusqwkGGaiD1U40//aLfLHGRcn4Aexj8deKTDqIpgw=;
	h=To:Subject:Message-Id:Mime-Version:Content-Type:From:Date:Cc; b=FRT5PnR39GQVRKmdbixRe4+10h0HIsN3dQ3sCKw1KXaa9qdfqXralE478Dgx/CvFq6IMPn+j8Ukm0rMkzT8pJyKveNlu/jxjxlB2KNjvPgZC+9yg9TMeL0wKS6ajKmX9xExsH/SD2/uRgHuXUkHKVkJzpz3ABJj8F0bBLXuiwTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com; spf=pass smtp.mailfrom=oss.cipunited.com; dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b=2HP/y21E; arc=none smtp.client-ip=118.26.132.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1773531707;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=TzyF1v0NlxN5WwXjtflZOgV+Cup/KHavISWhIQddOMg=;
 b=2HP/y21Equv0ZkfR9uS0yQe0N622cps0q3Xrq0XuIBwjSra49NjQXoATBMjPYvPzyStzj0
 pXkAIb7AJQLH8I3283375g+5dUqKkM7hU0HzepKSgFBCKBYyWWHhF5xreHztM4ODRCTjH5
 CWjo1vZC7Ejj5AzIgRr6rjBTQ5LBs1gmpkdAJbFyxd1UaAEzuQKo5JBSlbAFHSCLxlgZVo
 lMp0pHrlQObsuT3KD55e+cKKQ7gFUxrHu3TLefYn4QILzRmznEpiv60/d4aj3vwqFqDsEE
 7wcOLpgEmktAq6TWB2dkRmtOBT0jcexUZ1tbWRPm0hnnxkVQQ6rrCkwZwvQz7g==
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
X-Mailer: git-send-email 2.53.0
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, 
	"Jiri Slaby" <jirislaby@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, 
	"Huacai Chen" <chenhuacai@loongson.cn>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/3] MIPS: dts: loongson64g-package: Switch to Loongson UART driver
Content-Transfer-Encoding: 7bit
Received: from tb ([223.88.91.90]) by smtp.feishu.cn with ESMTPS; Sun, 15 Mar 2026 07:41:45 +0800
Message-Id: <20260314234143.651298-1-rongrong@oss.cipunited.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+269b5f239+2ca8c4+vger.kernel.org+rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Date: Sun, 15 Mar 2026 07:41:40 +0800
Cc: "Rong Zhang" <rongrong@oss.cipunited.com>, 
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>, 
	<linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	"Yao Zi" <me@ziyao.cc>, "Icenowy Zheng" <uwu@icenowy.me>, 
	"Rong Zhang" <i@rong.moe>
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oss.cipunited.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[oss.cipunited.com:s=feishu2303200042];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13640-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rongrong@oss.cipunited.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[oss.cipunited.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.cipunited.com:dkim,oss.cipunited.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F51028F8B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Loongson64g is Loongson 3A4000, whose UART controller is compatible with
Loongson 2K1500, which is NS16550A-compatible with an additional
fractional frequency divisor register.

Patch 1 adds loongson,ls3a4000-uart as compatible with
loongson,ls2k1500-uart.

Patch 2 enables building 8250_loongson (loongson-uart) on MIPS
Loongson64.

Patch 3 updates the compatible strings to reflect this, so that 3A4000
can benefit from the fractional frequency divisor provided by
loongson-uart. This is required on some devices, otherwise their UART
can't work at some high baud rates, e.g., 115200.

Tested on Loongson-LS3A4000-7A1000-NUC-SE with a 25MHz UART clock.
Without fractional frequency divisor, the actual baud rate was 111607
(25MHz / 16 / 14, measured value: 111545) and some USB-to-UART
converters couldn't work with it at all. With fractional frequency
divisor, the measured baud rate becomes 115207, which is quite accurate.

Rong Zhang (3):
  dt-bindings: serial: 8250: Add Loongson 3A4000 uart compatible
  serial: 8250: loongson: Enable building on MIPS Loongson64
  MIPS: dts: loongson64g-package: Switch to Loongson UART driver

 Documentation/devicetree/bindings/serial/8250.yaml   | 1 +
 arch/mips/boot/dts/loongson/loongson64g-package.dtsi | 4 ++--
 drivers/tty/serial/8250/Kconfig                      | 9 +++++----
 3 files changed, 8 insertions(+), 6 deletions(-)


base-commit: 69237f8c1f69112cca7388af7fab6d0ee45a2525
-- 
2.53.0

