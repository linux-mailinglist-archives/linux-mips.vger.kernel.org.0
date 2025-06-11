Return-Path: <linux-mips+bounces-9259-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A1DAD5F40
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 21:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E667D1BC23AE
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 19:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F3C289353;
	Wed, 11 Jun 2025 19:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="Vtqaf/GR"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5658F235355
	for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 19:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749671244; cv=none; b=io0f03YVB9HH6JGdnzaCKQ9yei5eNNeRCmLsY4DIgncMT6EmJgq/KfnisWdRdqxhxB80IWzLVZ9KQhEg9w3gBqaVHhnHlPi8iV4Y2gFtC/nRbBA/FmqDxTEVDcp4oyVcv/FKu3LTIX12M0WbwEiNu07v5pgSLjbu5muWz/6Olts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749671244; c=relaxed/simple;
	bh=qvatDExCgebdAU2j4wyFD6D0pfoMWXHYTe2aEbp6kZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b+n+yC6FtuYp/77vnhY2ql60T0Pwwb0d9MBc6BmEbc1h4tarkt8oahdC/f/mxJ1Vfen26yIc3OLhurspuxO+BHqDlQFYjfjtTQWQ+eUFZsPYrm9sGSjIa1GeJSqz7sIuUslCfjbKpU23pyAzxIqGL56FzDJ1ATTaeFUQJrTxVlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=Vtqaf/GR; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a3798794d3so277748f8f.1
        for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 12:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1749671240; x=1750276040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8RpoZJq2iKyPHdMzM6e03ta7krL20P5snKJVVti21nQ=;
        b=Vtqaf/GRsW8gY8q3NSMUXogenJnq+bKUPO9NU5zWhgDbDpOz9/pkwjTiD9gquXw6Eo
         dpoGSVtWQf4a8362uUNrQRs7TDj/oeqeMlMnQpvy7y/rkjnECHtkKoctpSmb5FnoW5BT
         lLW0M+l3hX/v6CjouF7kWZbwu8jt0IUcDkuaPJ0IXq6Pp5CRvOpy2cKdCwH8ZI0kzIFt
         mKvW8kPpx6hEAWmizps5a+bqtnNkAMBL0QxRlc5jTJFGeT2jjHFj68sO6wYpWOl+mGMZ
         GniY/21NWJMaZHkHgzYOm+zKdhVKSL3YyjLWhJ0PFLajdt381XpXtvVq2l2hnYnJOEuq
         m6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749671240; x=1750276040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RpoZJq2iKyPHdMzM6e03ta7krL20P5snKJVVti21nQ=;
        b=C3RNesUajyJjFQSSVKukxdzrAl9PBrd1Gs7go0JStMvZ9H/YvfJHjnsl1vrQH39gdV
         zIuHi4gasqmm/7ffymerOZVW4Xg+8jYZZhKtUOUFKa/WIvE512bPPspB9ZJP+k9E6e7Y
         SSSfYcwDTo9TR82DTLsi06woN3ppRsM4gve5LS2Lu7cbcarnxOBuYaUfseZXYD6XZRwC
         0DMcOgl6UVFo4aNM8ECJPA4u5PkbXKNodPdqRKSLlw9lqQHHXCBO8cH1h3ZWw/uH3wdn
         e5nGRIkEtb/XucTf3JP41pOeeLBxlgEjr5KtsN2pxuEWB+v5AO4nwbrQHqH3D/kb6MiP
         V0Mg==
X-Gm-Message-State: AOJu0Yz6og4R1g5FKboYM7xXVICSNnQ56xqNjYEU+VjalCKO07fmoeTO
	oB1lVdpJK3eAZS1PnCds0BwIm9eLKq3S65Z34/q5XmP6eWH44ska6I+Y2H867I+A8dQj8tD/phO
	ABwzk
X-Gm-Gg: ASbGncsFy7jgyf7L8wxL47C0E61aImflwkRzXdx5cXGTD1eATkQfOCOnj3tLJ77t3wD
	25Wdo1AByLrciXeLi+sPhBDLLLVJfecxvX5wKSSMzudYXAHL4e4XKSK7LwC4pAG3WdWmZ3q+sBH
	6wwPblJXFV7uJVFfULpEA3gtmnz5X0quyVIX1oXx9V92/nbB3/P0oqrdlrxXHdmjtw0QHTgzxbI
	u7r9kjVUyE1rPwKCnhiYEArP6sRbE/lUhp5YLSKuJfxnDujgQ44It2H+Lb760sRx5OwBV+UPIXB
	VUbeR5PgR9Xa7z/cBx+4HWxodkZ3zsvhHONxL1fNq9ENv6ZzIe+Fy+U5kPGn
X-Google-Smtp-Source: AGHT+IGN8LdRU2cQl/anZ9naq/oRl2rhKsUNsmL37962FNilm3Q2DGChyK39wNII1l1LzwSLePLGYQ==
X-Received: by 2002:a5d:5f84:0:b0:3a4:db49:94aa with SMTP id ffacd0b85a97d-3a56128d18bmr179900f8f.21.1749671240347;
        Wed, 11 Jun 2025 12:47:20 -0700 (PDT)
Received: from fraxinus.home ([2a02:21b4:9a83:1500:4cac:8ba0:e616:6d2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244fceasm15949433f8f.82.2025.06.11.12.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 12:47:19 -0700 (PDT)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-mips@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Reto Schneider <reto.schneider@husqvarnagroup.com>,
	Rob Herring <robh@kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: [PATCH v1 0/3] MIPS: dts: ralink: mt7628a: Tweak for GARDENA smart Gateway
Date: Wed, 11 Jun 2025 21:47:13 +0200
Message-ID: <20250611194716.302126-1-ezra@easyb.ch>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>

Various devicetree changes needed for the MT7688-based GARDENA smart
Gateway.

Ezra Buehler (3):
  MIPS: dts: ralink: mt7628a: Fix sysc's compatible property for MT7688
  MIPS: dts: ralink: mt7628a: Update watchdog node according to bindings
  MIPS: dts: ralink: gardena_smart_gateway_mt7688: Fix power LED

 .../boot/dts/ralink/gardena_smart_gateway_mt7688.dts  |  2 +-
 arch/mips/boot/dts/ralink/mt7628a.dtsi                | 11 +++--------
 2 files changed, 4 insertions(+), 9 deletions(-)

--
2.43.0

