Return-Path: <linux-mips+bounces-10325-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C3BB27FE4
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 14:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BA155C4BFA
	for <lists+linux-mips@lfdr.de>; Fri, 15 Aug 2025 12:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00971304973;
	Fri, 15 Aug 2025 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="TFIfiBUf"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544C3303C8F
	for <linux-mips@vger.kernel.org>; Fri, 15 Aug 2025 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755260206; cv=none; b=AR6f1LTlQ1s095jXC6HNgcQ0hc6OUjJJgrEwsqPiPUdYnMNngb9K3KB4z4hFK39UZh/+DwIz92TbFr2Q0ZsFRnngmWvpkg0OIQxqw3xG8/cgiLeTv466xqHZT1f81IdT7tnYX80N7oEsuLEys6RwvU4zYwUG9KMyd9Uz1FEV6xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755260206; c=relaxed/simple;
	bh=jfCSf6p9tA9bj+JTPbqnBT/qYxj3EM1PzKEg4HLZ9Ds=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T8ZbLSF3SWyWdyL9xfDBXeyAtsOtP7zST9rmAMwVk1FmX77Tjensijic2lTnPRp1mwcjQGixnRSzCEyWRxlcrwm52rqwrbiQnEGe4vrNMocHBGXZqWmwKWWKX6ubxZ8G7wCrBS3xmNnQ/NVZtBFr0aoOi+O1ObTHv3/L9g7lvEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=TFIfiBUf; arc=none smtp.client-ip=212.77.101.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 30380 invoked from network); 15 Aug 2025 14:16:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755260197; bh=XxsT9u/bn2Cw8UI50kEntS3WVMhKzCrN+NMcu5/psSw=;
          h=From:To:Subject;
          b=TFIfiBUf+I9LUmajccLU982GiMY1xuXEdH4tcZHTLSaMPFljPPMQUewWfLVTtGr/I
           UpPD3ylI7q6CIiXEROh7h395G3zgjicA5VBeOCJfFiY0Ui0nHoO755PxBwutdP4wc8
           jex2qQmcJvciPiTlFM5cNMQlUYB3S1dI+wDIhUNOwIt4BMDAiW2zFCv5Iy6AhK7+mD
           zjn/TTtU/zNv/ItgJ4hU8fz2GNbaga9CqKtmbRM82YaibQIgYWNYSAi8Oz1eDJa0vo
           kSY+7RwRS1iS6NVeHCNdBCG/0ixOk6L4nc+iiUuWd+hfIiZ7aGI5h4KcByLU3mFbm+
           aFVemOBlHYQsQ==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <john@phrozen.org>; 15 Aug 2025 14:16:36 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: john@phrozen.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	olek2@wp.pl,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mips: lantiq: danube: rename stp node on EASY50712 reference board
Date: Fri, 15 Aug 2025 14:12:22 +0200
Message-ID: <20250815121635.3397802-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: cd1bfe4adf4b0c912587650974b9f7e1
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [IUOE]                               

  This fixes the following warning:
arch/mips/boot/dts/lantiq/danube_easy50712.dtb: stp@e100bb0 (lantiq,gpio-stp-xway): $nodename:0: 'stp@e100bb0' does not match '^gpio@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/gpio/gpio-stp-xway.yaml#

---
Changes in v2:
- added sysctrl patch
---
Aleksander Jan Bajkowski (2):
  mips: lantiq: xway: sysctrl: rename stp clock
  mips: lantiq: danube: rename stp node on EASY50712 reference board

 arch/mips/boot/dts/lantiq/danube_easy50712.dts | 2 +-
 arch/mips/lantiq/xway/sysctrl.c                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.47.2


