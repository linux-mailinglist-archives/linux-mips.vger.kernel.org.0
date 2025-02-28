Return-Path: <linux-mips+bounces-8040-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DEEA49A96
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 14:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E77507A48F6
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 13:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDFE26E179;
	Fri, 28 Feb 2025 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="tTlkFLHE";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="V2Pl2jVz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13BB26D5DA;
	Fri, 28 Feb 2025 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740749673; cv=pass; b=XEvFHNLQDSgaftTvxnXiR5TlF2LiEZqkj6i+PeEZCEclhjgKH7cEGO92Yy/CucKVnH5ZyOGAePyfvdfYkwrvE3L1vd99SBefU15USJyt5qSteysfG/2zhmd0r6oBsTTXWnteN/Qltl69QZoi3m7CyhkBuJJxMJJIGC23ALVunws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740749673; c=relaxed/simple;
	bh=aTe8bIBDw9cNT4V5VGDu63y5GXCtXugACmEJ+LcwWoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kO32KneUw7KYVxvwLyBTdJ+EQXUdcUPmd4dZX7zVDHMbrFT7GksYZy2xjDCNh/Dm28sMDouVr1xfqwXoW8lX1TPC3goRrLQZJyhgJkSczG1xP+C7/soaQcLwkxiDeR9RCUcJRfhWdXCW6xhD4j/3tPE7ZowqTDrzIFeI5LIYSME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=tTlkFLHE; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=V2Pl2jVz; arc=pass smtp.client-ip=81.169.146.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740749646; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=f+G/EAN4xc4GVTe0hYDqhD0SgOtTZQzm+Ykkz7Ki2ChZ5KITxdnijP7OQkXsRjtVeK
    egIv4zUacB2gkYlZhy8K5PvDiehy0545tBFjJ5HXOaQPXiumoKeB0BARt2ztAz9dZN4h
    JEKWmBSAD1erLQTAeWwsw2tlbpTNK6BH65I3tOk9Tc4vhpfjhp//YEVgZyYdAojET1X9
    cHCBH5eyXjRoYxtcBUvQE746hE5FbiAg9YMVRHBqVjuJ9bMWcahYWheRL/h6hwxv8eN2
    YASnB0PUcdAQGltShz4Igu6CZ1AaDXGhLhURFdm2sRWN8x2H8t4WDfS/Wakb1PrIQbcz
    Y/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740749646;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QScjihLacGR1ZAHaGZyRgXvYewbSE/QRZuL+MAqnw2o=;
    b=MhHJsKauTauiUWe2exOcNloR8yGPz2ssXSMjX3u6hwY2qdc9HE4aImHcyhpmhOgZDK
    8gxt/VduBxCnPvs7XP1E0Kg4rziu3igPAlIxIyZgH9A1l9vE8FCtCbTos9b1Q7goC/Fy
    sAjjlRiuavibkRBpXiyo3hk5mY/OGpnTZu+gkrXuaBVy4B58DYn62t3hSxwpAFuhwRx6
    J1mZnhzWPn4A/2vbsK3WcKSsKo9nzc5bCxGBO8lPPFYGNlYtsos4+SE8WfmHkEzeBgE2
    9+4xS+CicSxigJfK/ha+XD7i49nB1f3mYl3cpIbJkGdZAq39E1Q1VcndWeDTFPevG92q
    iPlw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740749646;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QScjihLacGR1ZAHaGZyRgXvYewbSE/QRZuL+MAqnw2o=;
    b=tTlkFLHEJfEJdbYbvtGtVq291FyGyctn97pQLGCwk7Iv8lJIhiWyXsZXrpjo+uF9tr
    TB2JtLaAAykuYWtnvrgBDU87OhSI0K5XoprDE6eaIIXVT/146QGVDlVk2OPasbP2Y/Fz
    uuINhNwok3CvnHLIFYgJItOl2Fpgk4zwBWWwI4Sa+8tw6BxChlWoCv9HHJOGq7Ix4IaX
    tzqLe3Ephr6pBiNIZ4vo2pngREE6s7C4EC3At6xBZLj78cuWIKv7+l9KeyMzwanXMoIr
    uONqAkZDgtXPWAL396AxIU9zHn57RcKCR0AnfXcyJNkji8YGmuVfvofgfUwQ9Sn/KX/l
    bDNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740749646;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=QScjihLacGR1ZAHaGZyRgXvYewbSE/QRZuL+MAqnw2o=;
    b=V2Pl2jVzWFbB1bk5krZO51UG5HiHdW4ahYcQdhesjv5k5BtFcqE8BWlVI8JaGU+XX+
    hIdbLNQ6uW9Efq8sqlAA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeTkZ"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id Q56adc11SDY6L5X
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 28 Feb 2025 14:34:06 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Paul Boddie <paul@boddie.org.uk>,
	Tim Bysun <tim.bysun@ingenic.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 1/4] bindings: ingenic,pinctrl: add x1600
Date: Fri, 28 Feb 2025 14:33:55 +0100
Message-ID: <c42f0ad1aeedbfc90b9a5f10a36b2f5f2da528e2.1740749637.git.hns@goldelico.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740749637.git.hns@goldelico.com>
References: <cover.1740749637.git.hns@goldelico.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Add bindings for the Lumissil/Ingenic X1600 SoC.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
index 890961826c6f0..84e960255a36d 100644
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
@@ -42,6 +42,7 @@ properties:
           - ingenic,jz4780-pinctrl
           - ingenic,x1000-pinctrl
           - ingenic,x1500-pinctrl
+          - ingenic,x1600-pinctrl
           - ingenic,x1830-pinctrl
           - ingenic,x2000-pinctrl
           - ingenic,x2100-pinctrl
@@ -81,6 +82,7 @@ patternProperties:
           - ingenic,jz4780-gpio
           - ingenic,x1000-gpio
           - ingenic,x1500-gpio
+          - ingenic,x1600-gpio
           - ingenic,x1830-gpio
           - ingenic,x2000-gpio
           - ingenic,x2100-gpio
-- 
2.47.0


