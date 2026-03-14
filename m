Return-Path: <linux-mips+bounces-13641-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKuaDLjytWl87QAAu9opvQ
	(envelope-from <linux-mips+bounces-13641-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 00:43:52 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8215B28F8E0
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 00:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 403CA3018D61
	for <lists+linux-mips@lfdr.de>; Sat, 14 Mar 2026 23:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028A838C2B2;
	Sat, 14 Mar 2026 23:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b="vlQ/m5bI"
X-Original-To: linux-mips@vger.kernel.org
Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF152417D9
	for <linux-mips@vger.kernel.org>; Sat, 14 Mar 2026 23:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773531828; cv=none; b=qONvlESwvoBHjGz/iFLVr+b3EjK9GLr2lzxOY3OcPnaeV3cfE7gklGmEOVILrCXqTiYisSFHX7++Zd7BzgzJLd0J/s9Zgyz5ZTqFSrA6TeX+TkLpQr9uP5RnDlAy/nF+YSkRHSN6/v6HrF+yPalzQhzlapIiytnLvIv5VO/pOTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773531828; c=relaxed/simple;
	bh=jm7rXByn7R76HvNJnKE25FhL+cyLR5bGS1nz/RgRzb0=;
	h=In-Reply-To:To:Cc:From:Subject:Message-Id:Mime-Version:Date:
	 References:Content-Type; b=fNEtC1itYMv4HHtfkrv2WDa5WeFqHP12VTvBMrFk6QS3Mi09Z1DjleficdDGRNw3P9BgP6oW4K2F8kR7xdkX0gfIgsCBt0KM3JGzaD3xSdElAcHI18QCgf629vPapyd273IlQgdYKopfzP+T7qT0db9KxS3yazqPHWD7q4EwGPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com; spf=pass smtp.mailfrom=oss.cipunited.com; dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b=vlQ/m5bI; arc=none smtp.client-ip=209.127.231.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1773531709;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=NuHxZnrmW9mfPVCNo1dVIioyYd9nuGxeDz8GheH7iCw=;
 b=vlQ/m5bIbb8C8UgcB8z0cE7F6mKN/tCZG5QHy//NZsYWfkCHIkCslNuVW91rtk/02Wwn6+
 /mVe6QzVxmtvijmbg8pgyX4E0fbj6p3R9GFZQ9Hxso+Z2RlaP6iERnvI20rBw11ZCc2QVF
 YHwa0YAsJrthg2Tw3AKFbBACDYIV2G986SBy3lznjOCHeQCXYQ/yPZ2hpNe8aGW8Ky2TEI
 pRkqWIBes/9vzLjpEvfJyUE/f2YbgOFgFbv7w8cAa+i8LPMVFd8X8YeJ/JD5aV2r8yGUK5
 wmZ0fl6NltvLcVOGEKEMu8Nvlra4ubywhAXjREhWINjfqMgpKpKs7LEpa8vqtw==
In-Reply-To: <20260314234143.651298-1-rongrong@oss.cipunited.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, 
	"Jiri Slaby" <jirislaby@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, 
	"Huacai Chen" <chenhuacai@loongson.cn>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>
Cc: "Rong Zhang" <rongrong@oss.cipunited.com>, 
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>, 
	<linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	"Yao Zi" <me@ziyao.cc>, "Icenowy Zheng" <uwu@icenowy.me>, 
	"Rong Zhang" <i@rong.moe>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Subject: [PATCH 1/3] dt-bindings: serial: 8250: Add Loongson 3A4000 uart compatible
Message-Id: <20260314234143.651298-2-rongrong@oss.cipunited.com>
X-Mailer: git-send-email 2.53.0
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+269b5f23b+1f9f80+vger.kernel.org+rongrong@oss.cipunited.com>
Date: Sun, 15 Mar 2026 07:41:41 +0800
Received: from tb ([223.88.91.90]) by smtp.feishu.cn with ESMTPS; Sun, 15 Mar 2026 07:41:46 +0800
References: <20260314234143.651298-1-rongrong@oss.cipunited.com>
Content-Type: text/plain; charset=UTF-8
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
	TAGGED_FROM(0.00)[bounces-13641-lists,linux-mips=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.cipunited.com:dkim,oss.cipunited.com:mid,cipunited.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8215B28F8E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The UART controller on Loongson 3A4000 is compatible with Loongson
2K1500, which is NS16550A-compatible with an additional fractional
frequency divisor register.

Add loongson,ls3a4000-uart as compatible with loongson,ls2k1500-uart.

Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 73851f19330d..1d1f2a22776c 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -179,6 +179,7 @@ properties:
           - const: ns16550a
       - items:
           - enum:
+              - loongson,ls3a4000-uart
               - loongson,ls3a5000-uart
               - loongson,ls3a6000-uart
               - loongson,ls2k2000-uart
-- 
2.53.0

