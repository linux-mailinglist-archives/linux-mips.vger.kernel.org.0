Return-Path: <linux-mips+bounces-15736-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gVdXBpeYUGrK2AIAu9opvQ
	(envelope-from <linux-mips+bounces-15736-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 09:00:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBB1737E19
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 09:00:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=goldelico.com header.s=strato-dkim-0002 header.b=KnFZztif;
	dkim=pass header.d=goldelico.com header.s=strato-dkim-0003 header.b=QNALVMlk;
	dmarc=pass (policy=quarantine) header.from=goldelico.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15736-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15736-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4178300D966
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 06:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D073B4EB3;
	Fri, 10 Jul 2026 06:59:18 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638363B27CD;
	Fri, 10 Jul 2026 06:58:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666753; cv=pass; b=JMnouIYOjZDUjpLprRxTBsQLrpreqGUR9n/ZJx+iuInqmvA5VrFLZhkIrfFx4MlcSx701GhULOJVtFO9t7p8t0aUhIGJLigSYS5s3jb69Vl8kgH8ziDvoF7eTQ7xgkb8w6t5wa5WyodU5r8HIpTmXk7CsAIQhO/X15b68B2s9SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666753; c=relaxed/simple;
	bh=+8rfACDwqf1QFdMyzbhy+IhnEZnk+S/atr7RJjW37KE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SLtZnbe3mHwz/MBXBhl9FVRl05jwo4UwYWopXv5wIKHYuE6fXG6zVXmmB9okBFqg5jM6YkbiYh9t5pCzHoC9dtwRam0rzEdLQKGLnVqiGaR0LY7aZOMAz2o2dmO1aKvHs7ax+HfH5v9YMG13YPhVkAHa592PKyFlbgNvrFcLj08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=KnFZztif; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=QNALVMlk; arc=pass smtp.client-ip=85.215.255.50
ARC-Seal: i=1; a=rsa-sha256; t=1783666717; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=EWTDxA/9Qy/GrKlHDp9zdZpzv0IzOsDBvK5Ot0ABLEUt5LnBAwPkSFM8qQm5v4dMAu
    sq1wC8CpV/CXzGLC48OHP1dyKOBZRNJxPD3UX1Zrmzvx3ts33/ZGTAL2cYSevlA+NycJ
    jrTFt0bSJ8cbujE3ebtGHPCrliszeyCohGSj3FLgA0Tu6jTvq50ZjLODvg1xaSk8NAqS
    Q5LDF0sdzrVhAz8An82OP+Nqc+g5CWt3MGFNKZ+pTmmY5h8KQagbAM0il8CLvVBG9Day
    Ld2WeCXvw4EqP9r8jQ/XPKZFkV6wKt11OWdvVRGfHX67oZjKw/JNRhYdpvkGu63HDOjP
    dnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1783666717;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=oNO20A98MQL4gy0CXjphwlY7xBkkuVdv5tUxEB2ykF0=;
    b=s0P5/twWw+7mqcIOdiHOapnaVB5H0FUDZNYcxcFaKDW57hL6S8ee3b1qfsJPpMSHGb
    +4nuPgDw60L6BxU89m8Sq3zcWoVRTvbR/MmKUm5d5HML7i2OIYUDG8RN2B0JxJcNYIva
    caTT+KEFezP9zMUPM0yYOJMbbOzFfAvkUPyP/+ZZwcbSTw1jCHmy7tuwH1uiLQ9ixhFl
    pLf9Ya7WgwndKzCmRAPpwMwy/iWVSDuw4zapb0RiNP+haqGh9Kq03SvkoPrtmUS/RCdM
    EE41t3kn1QSgqAl44QMe8QpzlRgtnqiaPKTYmTA2dKJG2MZyCd0xlFkmBCqRvgU8Prq9
    FPTw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1783666717;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=oNO20A98MQL4gy0CXjphwlY7xBkkuVdv5tUxEB2ykF0=;
    b=KnFZztifA7UujJwnpvJ+J16YijfTiUSghz9Kpf0cQ7Ex26oMlLPxxCEUbyunWIkrmD
    GrTePAXR7M8FZYyJMEa3/EUoZ6WEkRr0GVyWIDG0f5rwG4qYTs8wDTWuScS/oI6IpISs
    vbgvXMevITHdjJWJu4/oAFzz0W876bcC+EMskAQzw/EfftD/TSSQ5k/GHZe7scbMF6qt
    k0iM0lTkq7xka2zvFM4LhCO/CeJDks9gk2mZZm64mDp0NDxZBP9rY/zHvHz28JOKyn1B
    gO1poVcbCEtAILLoUAtWI/5RIoNI/6kS0Xzb+RI7k4lVl2WORdheovHe6de91o80Da/5
    hetg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1783666717;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=oNO20A98MQL4gy0CXjphwlY7xBkkuVdv5tUxEB2ykF0=;
    b=QNALVMlk57qXpRHDuWJfOuSB7cim1EjTYZyBRqvwe92vSX4g4rm0W2MN3Jp1rIU+7z
    29OlLbGAU8wZwDW4APAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrSipoMnMiNyg00cKH7E+fgnZCGa9pyCzl5Kpca"
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q4b76426A6waAAM
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 10 Jul 2026 08:58:36 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-mips@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: jz4780: Cache clock rate at probe to prevent CCF prepare_lock deadlock
Date: Fri, 10 Jul 2026 08:58:35 +0200
Message-ID: <c69ca6511780aa4759a428cb7fb70de43ee5211b.1783666715.git.hns@goldelico.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[goldelico.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[goldelico.com:s=strato-dkim-0002,goldelico.com:s=strato-dkim-0003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15736-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hns@goldelico.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:paul@crapouillou.net,m:andi.shyti@kernel.org,m:linux-mips@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:letux-kernel@openphoenux.org,m:hns@goldelico.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hns@goldelico.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[goldelico.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,goldelico.com:from_mime,goldelico.com:email,goldelico.com:mid,goldelico.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BBB1737E19

Fix a severe AB/BA deadlock between the Common Clock Framework (CCF)
and the I2C adapter lock, which triggers when an I2C-controlled clock
generator (like the Si5351) is registered or modified under the CCF.

During a clock frequency change, the CCF acquires its global 'prepare_lock'
mutex and calls i2c_transfer() to update the chip registers, stalling
for the adapter's I2C bus lock.

Concurrently, a parallel transfer on the same bus (e.g., a GPIO expander
handling LEDs) can hold the I2C adapter lock. Inside the transfer path,
jz4780_i2c_set_speed() calls clk_get_rate() to dynamically calculate
timings. This call attempts to acquire the blocked CCF 'prepare_lock',
creating a circular dependency that freezes the system or at least
the involved processes and workers.

Eliminate the synchronous clk_get_rate() call from the active transfer
path by caching the peripheral clock rate once - inside the private
jz4780_i2c structure during jz4780_i2c_probe(). Update
jz4780_i2c_set_speed() to use this cached value, decoupling active I2C
transactions from the CCF internal locks.

Assisted-by web based Google AI.

Fixes: ba92222ed63a12 ("i2c: jz4780: Add i2c bus controller driver for Ingenic JZ4780")
Cc: stable@vger.kernel.org
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/i2c/busses/i2c-jz4780.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index 664a5471d9335..d729cec9cdf2c 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -141,6 +141,7 @@ struct jz4780_i2c {
 	void __iomem		*iomem;
 	int			 irq;
 	struct clk		*clk;
+	unsigned		long clk_rate;
 	struct i2c_adapter	 adap;
 	const struct ingenic_i2c_config *cdata;
 
@@ -246,7 +247,7 @@ static int jz4780_i2c_set_target(struct jz4780_i2c *i2c, unsigned char address)
 
 static int jz4780_i2c_set_speed(struct jz4780_i2c *i2c)
 {
-	int dev_clk_khz = clk_get_rate(i2c->clk) / 1000;
+	int dev_clk_khz = i2c->clk_rate / 1000;
 	int cnt_high = 0;	/* HIGH period count of the SCL clock */
 	int cnt_low = 0;	/* LOW period count of the SCL clock */
 	int cnt_period = 0;	/* period count of the SCL clock */
@@ -796,6 +797,8 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c->clk))
 		return PTR_ERR(i2c->clk);
 
+	i2c->clk_rate = clk_get_rate(i2c->clk);
+
 	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
 				   &clk_freq);
 	if (ret) {
-- 
2.50.1 (Apple Git-155)


