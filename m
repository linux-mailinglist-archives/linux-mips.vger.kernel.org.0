Return-Path: <linux-mips+bounces-13649-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB+cFMX9tmkrLQEAu9opvQ
	(envelope-from <linux-mips+bounces-13649-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 19:43:17 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FB3291F55
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 19:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A403A300F940
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 18:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3442E37B019;
	Sun, 15 Mar 2026 18:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b="EH3pQm2s"
X-Original-To: linux-mips@vger.kernel.org
Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B84C1FC8
	for <linux-mips@vger.kernel.org>; Sun, 15 Mar 2026 18:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600193; cv=none; b=u8AHcRCALocDN+ASud4+CYq3hkYfZJPeo+/UVvzVnNCYJNQSdzhlutopjIjxavUn7TfOmJLkVf3jRLu3EuL4Z/bXfcBEtylkxnba+9GseDxcEhWzW+K7vsTZ+sxqnCRHB+Kxp7+094VxCq/wh4kMWKjjNGqGncvsUVKBBrSKOOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600193; c=relaxed/simple;
	bh=q5xIUKZReGhegwzVm5wpFVFK6UdQUvqkkcucwpyLAKU=;
	h=To:References:Cc:Date:Message-Id:Content-Type:Mime-Version:From:
	 Subject:In-Reply-To; b=Cgmq3f/nELZcu1HUQylYwC+n89TH9+7/AifpL+6RNC6l+tub470IoPT1DQknkuda2pfWcPzpRwJWJ9bxHyOSF5zDJEyfvTZtbz7H2kEWxpRS+EXhwieq1Q70rgsU0MRmUQiqwCkjcTZisz3WJPQMnjOo8bQsnTlzY98FPHIFP2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com; spf=pass smtp.mailfrom=oss.cipunited.com; dkim=pass (2048-bit key) header.d=oss.cipunited.com header.i=@oss.cipunited.com header.b=EH3pQm2s; arc=none smtp.client-ip=209.127.231.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.cipunited.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.cipunited.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303200042; d=oss.cipunited.com; t=1773600186;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Mlb8YeoNc+25qTnDUkz1Hsif+FZNdijfFkl8bVFYpk8=;
 b=EH3pQm2s/vUmyzDBGrCTHbyAaUaqNq+II1oTccDNIWiR0lLeBdVZ+GXFpI5k1vOfDPOm4k
 YVhX2m/K+bbAGmD7mqrQl/oHaS+m4KTe6VCyzjQkQI42RbNxyj4zx4IJaQqREv9iEzY3xo
 2oOaUwExPfFtXVtzK2N5+lasOKTmWoppFv3Bk4MICARsF98pnN94+UAV9NIdVvgxKJ1bYT
 mXVTEf4LPj9iQoDjWzT4YT5bI18uYnQo3+GhtVLdGCReqyrRLiBkXiy8ofhS3Q0B8ul2Qc
 pAHsDrfvojJquK58lAfKLqjLYM8ZjFc0QhK8k9WJ7owJjnEWySUcR+mKPDyggg==
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, 
	"Jiri Slaby" <jirislaby@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, 
	"Huacai Chen" <chenhuacai@loongson.cn>, 
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>
References: <20260315184301.412844-1-rongrong@oss.cipunited.com>
X-Mailer: git-send-email 2.53.0
Cc: "Rong Zhang" <rongrong@oss.cipunited.com>, 
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>, 
	<linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	"Yao Zi" <me@ziyao.cc>, "Icenowy Zheng" <uwu@icenowy.me>, 
	"Rong Zhang" <i@rong.moe>, 
	"Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 02:42:56 +0800
Message-Id: <20260315184301.412844-2-rongrong@oss.cipunited.com>
Received: from tb ([223.88.91.90]) by smtp.feishu.cn with ESMTPS; Mon, 16 Mar 2026 02:43:04 +0800
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+269b6fdb8+ed863d+vger.kernel.org+rongrong@oss.cipunited.com>
Content-Transfer-Encoding: 7bit
X-Original-From: Rong Zhang <rongrong@oss.cipunited.com>
From: "Rong Zhang" <rongrong@oss.cipunited.com>
Subject: [PATCH v2 1/2] dt-bindings: serial: 8250: Add Loongson 3A4000 uart compatible
In-Reply-To: <20260315184301.412844-1-rongrong@oss.cipunited.com>
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oss.cipunited.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[oss.cipunited.com:s=feishu2303200042];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13649-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rongrong@oss.cipunited.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[oss.cipunited.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 38FB3291F55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The UART controller on Loongson 3A4000 is compatible with Loongson
2K1500, which is NS16550A-compatible with an additional fractional
frequency divisor register.

Add loongson,ls3a4000-uart as compatible with loongson,ls2k1500-uart.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

