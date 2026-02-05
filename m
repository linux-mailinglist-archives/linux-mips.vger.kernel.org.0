Return-Path: <linux-mips+bounces-13123-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMC0NEFshGmJ2wMAu9opvQ
	(envelope-from <linux-mips+bounces-13123-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 11:09:05 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E87D6F12F0
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 11:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 567E53002B75
	for <lists+linux-mips@lfdr.de>; Thu,  5 Feb 2026 10:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F1F35CB71;
	Thu,  5 Feb 2026 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="eit+b4Jq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VsEBAonz"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A9033B6F3;
	Thu,  5 Feb 2026 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770286138; cv=none; b=SO8OzWBiZDEOpQXOMKJjrJ77rJcatNVGkY3yaaHOSKVOuwON4AdIsEqRuVEzyu0pzfuTPdNO0EaW25bQ73g78fOQcJfYjqCY2+OmIwMNGofHOv/D/p3z3bQocQUxiJqnY8rCO6bSI7r+NlLjtOFzlF1OWnEyGoHoBeOjK9+W7wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770286138; c=relaxed/simple;
	bh=ixCxdi41vK8VCutYBexrUwTUpNR4QEtn7rDGMBgLSNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZJKY4Do4NxbiD284mxyx9LSiaZNuz3AkD8ek9wU56gBQqpQzQQG0s4R1QPg3HBCk5FrBKOfo6ztWlVtBDtsmankCMv/ggR520SuBfiU54Vg7lDw4jbJgwL6qjfvNtWqHN/Q1ycYbF8DYMd0BkmEEwOQwEDlN7dpFXnlHHv7nEx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=eit+b4Jq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VsEBAonz; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 876671D00199;
	Thu,  5 Feb 2026 05:08:56 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 05 Feb 2026 05:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1770286136; x=1770372536; bh=Lc
	lXPKST+gI7ox8r4avoEEUttlMxiCLYezVoioHYyYc=; b=eit+b4Jq1MELoS2ZIa
	K/qzGHobT9gCDo0wcBrGkDsHXbGpjU3wbMkpQ0AQDgxV57Ad6njTiK7XJ7DMyiZz
	Azp3Uu8bZhtsGSYfzBYICs/0+u9DWh7+bWiuke7bxIYXYzd+0BFimEChSlAvBM5C
	KAJwT8NXZ1pIhG7xLbqS7ovQf/g8W2aiQ+7YBiYeIUGv3aK2kFDrjHDMGXD4nw+4
	PuU/RWQgiRhVDIApbGMRSi7EA+c3/GINeI9y7AoElvBb+huIxhdZ86U91S+8988c
	K7USaUtRvB6i6DnvEh+FkH4qOqgODz1AsBQFXx7YxUwtGONIjxCrJZ6CRbe5uNWN
	gKqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1770286136; x=1770372536; bh=LclXPKST+gI7ox8r4avoEEUttlMx
	iCLYezVoioHYyYc=; b=VsEBAonzvmh4r4ZZzJiSvmrrp8w6g9bXEBscAR+D/bY1
	qRFdl9fjftA2uewvIeEbvJFiIjqpRP0RGzUNUsJWY7CavMrQ2XjIZGXIGu7yAsvE
	WeSo2j32Cw9Pb6R8TX66vyLKTzx4RN+Y5ahabyA++TGw+uc+AUuY9fQHdZfociPf
	9B8tKsBEFoeRfy5QB+lZwSfWXcfwGsoz+eG5aktUMuC87krFk51KfL6xv58dho8y
	r22mgVhr3J/f2eDMO4OnkUfBfrdSOGxmpf+joB1ngOeQFVyVFeRQGmCP8aUVqlmh
	oj+BplHMvAWR5Xi72Yclny5wfJ1gYBjcaqHY4sfB6g==
X-ME-Sender: <xms:N2yEab1rGhAJAt_8aHcsXCDbHD6aSVFKAcT-XbqKh_gIaIe1aobsyw>
    <xme:N2yEacqN-wJPRm_LQ2SR3aJRdQOzgUncZI3cjDwX_jLkxFMoEldg4AFAGj57YJfuo
    CmdHZlOqBmaaCkysi2q6mv1LS9ElS58_SWA9h5WRIS1DukIfoa26uo>
X-ME-Received: <xmr:N2yEafiv1K_9QbQOBS7ufSxV1GZynyEbSirGg2rQbs-iuSEqDq4-TsnPp-yRP0t7ThUzwzKl2dQIwqW-aRav2mVqsyT7MPXTwA8zf6c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeehtddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflihgrgihunhcu
    jggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrf
    grthhtvghrnhephfffgeejgfejieeugffgudegvdekffevgeeuteetgeejveeiteeivedv
    ffehlefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
    ghhorghtrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtg
    hpthhtohephihihigrnhhgudefsehhuhgrfigvihdrtghomhdprhgtphhtthhopehsthgr
    sghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihgrgihunhdrhi
    grnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigsgiesohhpvghnrggukhdroh
    hrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhr
    gh
X-ME-Proxy: <xmx:N2yEaQ9y1EkJTeplgHokZR9YI7h5m29lGsFKTCZ5450jfI2CSxIz8g>
    <xmx:N2yEaTU6Qvd4BNlQ5oqPnoEUIhd9ox9qmfEHwQ-muPsXWvkq3SEv9Q>
    <xmx:N2yEacAc_HdEIEogOVVXXIv9DEyaUQ5YropO6a26sEJSwYj0To5XBQ>
    <xmx:N2yEaQG6M2Izz7YJ00jFE--upK9Cj7uX8iT9ecd2_w-XrEzCd7OU6g>
    <xmx:OGyEabdAj0gZxYlxpSk6B539eWm8z305RRVCQ2oXkNQkK6aDSQpAjjzr>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 05:08:54 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 05 Feb 2026 10:08:42 +0000
Subject: [PATCH] MIPS: rb532: Fix MMIO UART resource registration
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-rb532-uart-v1-1-334dbdfafa60@flygoat.com>
X-B4-Tracking: v=1; b=H4sIAClshGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNT3aIkU2Mj3dLEohJd0zSjFKO0NCOL1CQLJaCGgqLUtMwKsGHRsbW
 1AO0R9N1cAAAA
X-Change-ID: 20260205-rb532-uart-5f2d2ff28eb8
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Yi Yang <yiyang13@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Waldemar Brodkorb <wbx@openadk.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=ixCxdi41vK8VCutYBexrUwTUpNR4QEtn7rDGMBgLSNI=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhsyWHFNzzrTQ7wYFn/kMZ6xPEjsU2S26ZFbePd9b9pJzP
 gq6pR/vKGVhEONgkBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgIn0lTL8T1+7v+HPsS1PNV/t
 dVx2qX6z6XzjiGVvHR8vtlh7hXWaTyojQ7PWzqL9E4JislXncgcbaG6YImx4aTcj0+K4mas588o
 jWQE=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flygoat.com,none];
	R_DKIM_ALLOW(-0.20)[flygoat.com:s=fm1,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[flygoat.com:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13123-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiaxun.yang@flygoat.com,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,openadk.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E87D6F12F0
X-Rspamd-Action: no action

Since commit 6e690d54cfa8 ("serial: 8250: fix return error code in
serial8250_request_std_resource()"), registering an 8250 MMIO port
without mapbase no longer works, as the resource range is derived from
mapbase/mapsize.

Populate mapbase and mapsize accordingly. Also drop ugly membase KSEG1
pointer and set UPF_IOREMAP instead, letting the 8250 core perform the
ioremap.

Fixes: 6e690d54cfa8 ("serial: 8250: fix return error code in serial8250_request_std_resource()")
Cc: stable@vger.kernel.org
Reported-by: Waldemar Brodkorb <wbx@openadk.org>
Link: https://lore.kernel.org/linux-mips/aX-d0ShTplHKZT33@waldemar-brodkorb.de/
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Since it's a partial fix to the issue report, I'll not use Closes
tag. checkpatch is unhappy :-(
---
 arch/mips/rb532/devices.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index 8ecb56be81acc36e39192dee9f5d2a4d19b3755c..4f027efbf27b05377ddac306ff16714b8764915b 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -213,11 +213,12 @@ static struct platform_device rb532_wdt = {
 static struct plat_serial8250_port rb532_uart_res[] = {
 	{
 		.type           = PORT_16550A,
-		.membase	= (char *)KSEG1ADDR(REGBASE + UART0BASE),
+		.mapbase        = REGBASE + UART0BASE,
+		.mapsize        = 0x1000,
 		.irq		= UART0_IRQ,
 		.regshift	= 2,
 		.iotype		= UPIO_MEM,
-		.flags		= UPF_BOOT_AUTOCONF,
+		.flags		= UPF_BOOT_AUTOCONF | UPF_IOREMAP,
 	},
 	{
 		.flags		= 0,

---
base-commit: 0f8a890c4524d6e4013ff225e70de2aed7e6d726
change-id: 20260205-rb532-uart-5f2d2ff28eb8

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


