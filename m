Return-Path: <linux-mips+bounces-9470-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC88FAE640D
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 13:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FD3E170874
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 11:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC4228ECC8;
	Tue, 24 Jun 2025 11:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="DIrrdyFS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CE928DB7B
	for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 11:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766299; cv=none; b=C9jbfZbRVGk02M5qNiHfPo9omyjSLxQRn4YKxg8AAYNyt75dfs4cFGKbnpGeGPG6q5Kc06S0XoBCxnf2jlV70KRsONWQEfUBtHlFE2pW+waIf5U6SncLusBhinoS7iARQwwQXvqCxCsslQYKCe+vLyLRurLKdZ0RFabKEwvGyZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766299; c=relaxed/simple;
	bh=Ujm4ZSwsjseF6DK2QFoKOIfCHDOOOwtTLkaYp5DYTJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qG2wyUeYVO9/EFMG1yKd/0Wzzvku/RCcgbfULF5hRZ5d19L96Kjef5dWU1taMQj2KKrbCENL6wX0BIVF364+sWWzgvTscwcfTGPWZx6R+KebIrFdL/4w8H2TZU1hqolveKjKnHs0sV+T/U4IjLnEfum9qILTEKqRF9Ru+L188IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=DIrrdyFS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso45035715e9.2
        for <linux-mips@vger.kernel.org>; Tue, 24 Jun 2025 04:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1750766294; x=1751371094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VasdYnmyrBpAhDisiEDDk5E4G8eAR7AiKnkb2f6t73A=;
        b=DIrrdyFS1QZ/RDlW3DRsqiU67VlwNwi/PrRhywAaJhoiqHBC5UIsnxnoRNcWlQk9TM
         BCYmgFL/GEdjCVZhN4DZpKN0qToMERU8AcuhHXspsYkWB1DHCLk9sywVOGQTOmeShaSp
         tobf0Kgm5uPugqVP+S7KmP1PKmgvAc1e+PB1qX2xgCsemUbajKuGIpgQfNupCF/Ts718
         cb2Wlfn69cV9B0cmvaXtcCA7o64uTm8XQsvWQAN6UOPvnS3cJ/O+28DmsCcK5VnGLNh9
         g7E85neOO+Ova5i9kiGCMH9OqZ2GJMWpq3MDXJiXXuGOzh4LzHbsTMvLLzUjh2zSJ618
         g5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750766294; x=1751371094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VasdYnmyrBpAhDisiEDDk5E4G8eAR7AiKnkb2f6t73A=;
        b=AnnDAKaK+cpbZECmoCP9DhC7GQ3ClkxYT8WM39p5T1w7bbpX8mGKals+jbgLtsgMFb
         TojG7luUbki+cca3xe+2ljLQBjB1R3WhZZxbvrJ1D+eLzC0jGq4PY1vXaHL7c1Ixe/2l
         PrcTIuv4cZc4SntKY7VvrHJuww7QU5qh6FWuFyWm4qL9PMbtakJAVfeDvRl22n4yNJJ/
         2l8jAb3rPq+2oI+gEYiPr+2VwZ5DdLPOrZdWO/lVMzOWFN89vRaURwQePq/Oi/QY47b1
         pKjMO5cSjumAJpqBhV0Vq5iXpyBAKBzQymxPW17nXWAHpr1oMOhFlQZAfvYXw9ykb7gk
         YV9A==
X-Gm-Message-State: AOJu0YzJ35IUjbxI1Zz+tSqF8+OQYIh65qWV1Sf43ftkGlfP/5N9kJyp
	KIrfp+WhTN3tAbKD8aaUQroUzUQckVnUGuDiCEZme/lPYqgk/aOwses+SyZBxIFMhonWjeob6eW
	qej17
X-Gm-Gg: ASbGncswtW8JXQ75Eg9+G6P/ZyfdUA7Zses8NKR6AYPHu+kjNnUpCk561zIcgmr5+yo
	yX7iuTJDWUwxRgbBdEZa04i0pdjd5U3IsQ86QJJ/+ShNeeRvkqjGnRAPjuaVdt0oket9nXKXRxt
	lJvFUEXKBDHhD/e1TjjwaU/IDHa1xzlhFTmEL60/NH011Q67JSQb94JN5waiT9x88ho4a9OPpGH
	OW3SKGh50+J8fHye7O3EOfA+c9aPeul1nRqBh4cHCziyp7kbE7FnUawG3n9w9V+z76ABSUGCmdJ
	WkIVgPHpgkoC2VCOnwJJuboC5ueY0tgqT95iwgI+9VEYpoV0ysB1RHBk1+AQ
X-Google-Smtp-Source: AGHT+IFT0ohwcG0u6Bo2EUcoP+iKDc3WXdNhr0CNYzUzlN2NpVjYUMFjHkuhfdLKZd/XGh0IjpadCg==
X-Received: by 2002:a05:600c:6206:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-453659caa7dmr147389975e9.12.1750766293338;
        Tue, 24 Jun 2025 04:58:13 -0700 (PDT)
Received: from fraxinus.easyland ([2a02:16a:7402:0:d834:684f:62eb:5df0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a5fsm173860985e9.34.2025.06.24.04.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 04:58:12 -0700 (PDT)
From: Ezra Buehler <ezra@easyb.ch>
To: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Reto Schneider <reto.schneider@husqvarnagroup.com>,
	Rob Herring <robh@kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Subject: [PATCH v4 0/4] MIPS: dts: ralink: mt7628a: Tweak for GARDENA smart Gateway
Date: Tue, 24 Jun 2025 13:58:06 +0200
Message-ID: <20250624115810.37851-1-ezra@easyb.ch>
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

Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
---
Changes in v4:
- Re-add ralink,mt7688-sysc to enum in mediatek,mtmips-sysc DT binding
- Link to v3: https://lore.kernel.org/20250619203502.1293695-1-ezra@easyb.ch

Changes in v3:
- Remove duplicate entries in mediatek,mtmips-sysc DT binding
- Link to v2: https://lore.kernel.org/20250617103058.1125836-1-ezra@easyb.ch

Changes in v2:
- Add patch for mediatek,mtmips-sysc DT binding
- Add Reviewed-by tags
- Link to v1: https://lore.kernel.org/20250611194716.302126-1-ezra@easyb.ch

Ezra Buehler (4):
  dt-bindings: clock: mediatek,mtmips-sysc: Adapt compatible for MT7688
    boards
  MIPS: dts: ralink: mt7628a: Fix sysc's compatible property for MT7688
  MIPS: dts: ralink: mt7628a: Update watchdog node according to bindings
  MIPS: dts: ralink: gardena_smart_gateway_mt7688: Fix power LED

 .../bindings/clock/mediatek,mtmips-sysc.yaml  | 28 +++++++++++--------
 .../ralink/gardena_smart_gateway_mt7688.dts   |  2 +-
 arch/mips/boot/dts/ralink/mt7628a.dtsi        | 11 ++------
 3 files changed, 20 insertions(+), 21 deletions(-)

-- 
2.43.0


