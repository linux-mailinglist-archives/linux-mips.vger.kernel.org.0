Return-Path: <linux-mips+bounces-14336-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO4wD5OL72nuCgEAu9opvQ
	(envelope-from <linux-mips+bounces-14336-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:15:15 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC13476226
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 18:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC5CA30F2AD8
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 15:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5B7344052;
	Mon, 27 Apr 2026 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dONV+fGE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF7A2F9D82
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305273; cv=none; b=SaPWi7rvyLcLYar/32JFO97ccNHqmTvr+tS+On8Rwa9GXxA6mEDF/bDfQnEzlty77AFQNiAJLW4SN6rcHyoTqSo/+92d2ygqah7cQrjteVntRCDOSkljj6y+JFRaHNUZh+fpAXf9je84YDAtnnS0uE7s6Y7W80eCulspWDBjjxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305273; c=relaxed/simple;
	bh=QYIETYCuf4XH2n8d+qC4biDZlEAIskUJbYZoYf67LHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u0WCHbA67qRuxsYolqgJ+ZpNDLHgofhCQMKN98UEDKv0r1OMbXatjUZUcxOVQ+yZ1AIK7zGndas4UUjbTEkLfF40jRNGiAucozu8vzIPJCzOvwUopSVY0y+WHRJk2ypn+9s3jFWM/mo7zPK5atosbSwl2sBb9NUgGvAGUeo8zF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dONV+fGE; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35fbca04006so5211043a91.1
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 08:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305271; x=1777910071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tuu1s9tU3uSim9SJGKXaRXNcFSL5VnoinNEq7EZdSCo=;
        b=dONV+fGEr0l8w8EifgcREw/4qH8wLk/MWXCfdSOxCmS61yP4qCIPXHgV96EXIcwWWn
         rExIOmvr7Xvvtlkt4mMPOUn10n9QH9EVBDBKN3KfW/zG7xmDul0YRIjZCF7GyodjCCvJ
         y3XKUA9O3ME5nwdot2A9rbgMUHOa0Lg7P7a+l7yh8et9HERDZSOgQ8HSFtDiDjWJ2Q+z
         8loBZ+Zcz4de14EW+zE3Wtv1fPXRV8OUn//2qEG8nNYyIbfklXhmnk20BEczYT33CBF4
         9HsEOnMxcfQ4TIj2ISLdObCAfa6+B/nabrvjepP/tEigEXJDSUHl5g6l3GaErq+hvDYa
         KcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305271; x=1777910071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuu1s9tU3uSim9SJGKXaRXNcFSL5VnoinNEq7EZdSCo=;
        b=QuT5T+uAPuN3TjqhxSuRErBO6LiwYLmO9ywhqWRufqvw0Du7Pi7dvyCseCQq67enrk
         aueemWWPOjYOyktZ9dRWsL97d//HJQhqhT7YjbYQ1Wpe1Q3uHWr9PqwIz9uDHdJwmOuG
         wmGz0pdLNPbNj3/smW7oT0yocH/6isiNbmYVUkcJUxtBsWKHr9s53z7tWIVBCO+tWqqG
         3BcOo6HmAUagCiALBTzeLqkeF7f+7BaPON8KfLkW6OBZRQRASHXhr+F04U8ohx2XioR9
         A4xu18Qngr1R08piMjpe5NC3JlJCjs+OfuxmA6Y4kMWFHLfBhOH7Q3b0NktKYlT8+m1S
         yAjg==
X-Gm-Message-State: AOJu0YxvATm3kyUeErFoJDq8I+K20I6vg8NvPciS5tnzWir5bypCBWnk
	uXNo5OvykgHlYM2nqkbHtIN+fwc1GwbEgEaVQwVkoZ4FQo+txNSSy1yR
X-Gm-Gg: AeBDiesD7UAgpfvPrZXppD6AMvj+b1U+gdw3XplCPviCI8sUs6rxuJ+UuiRkbts+xQL
	/jkrbGwVJsJDQltpf+TrHHo9AQkrmkTqgjLIYwLgO0qGNx6lt5+Mj432vC1aE3F6qXR6kjnGJHz
	arigXxKdssElZod43aTDo2oIs2LXirJQ2tcm22+CNABWjLJuay1vb6m3xNDLdIjTSApbe9JTcjP
	iOoQ6OYm71tUan/WImlIjHNmKdaiAU2hs0hZ0DVhlr7XBhxTOa6LwpoK+CRmzhqaEav7qFnD7OF
	k6UnLoZEDXWKJk8mbmc1gN+gpikFSG+VWyp0kLw75G1CAtfRqRtPrhKibnBmPdl4iWzgSFTllfD
	IYmjIpM8OzaYHwDue9LUilvYixHjt2FOhAUrtyzmTJdCQkXmFHRm4TcX3POcrrB/X2JfWh8I02y
	8xZcY9+flqZ2onE1KVxCj+m2NZD7R7cnDXQ4jWI1g5
X-Received: by 2002:a17:90a:dfce:b0:364:78a5:8d39 with SMTP id 98e67ed59e1d1-36478a58eb6mr5217870a91.20.1777305271444;
        Mon, 27 Apr 2026 08:54:31 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797702fbfcsm25138982a12.22.2026.04.27.08.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:31 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 0/7] staging: octeon: remove typedefs for enums and structs
Date: Mon, 27 Apr 2026 23:54:20 +0800
Message-ID: <20260427155427.668540-1-kunjinkao.jp@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CDC13476226
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-14336-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[kunjinkaojp@gmail.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The staging octeon driver's TODO list includes "general code review and
clean up". This series addresses that by removing unnecessary typedefs
for enums and structs, converting them to plain types as required by the
Linux kernel coding style (Documentation/process/coding-style.rst,
section 5).

All typedefs ending in _t have been removed from the staging driver
stubs (drivers/staging/octeon/octeon-stubs.h) and correspondingly updated
in the arch/mips/ implementation headers and source files.

The series converts:
- 5 enum typedefs to plain enums:
  cvmx_spi_mode_t, cvmx_helper_interface_mode_t, cvmx_pow_wait_t,
  cvmx_pko_lock_t, cvmx_pko_status_t
- 2 struct typedefs to plain structs:
  cvmx_pko_port_status_t, cvmx_pip_port_status_t

No functional change intended. All patches have been compile-tested
for both MIPS (cavium_octeon_defconfig) and x86_64 (with
CONFIG_STAGING=y, CONFIG_OCTEON_ETHERNET=y, CONFIG_COMPILE_TEST=y).

Eric Wu (7):
  staging: octeon: convert cvmx_spi_mode_t from typedef to plain enum
  staging: octeon: convert cvmx_helper_interface_mode_t from typedef to
    plain enum
  staging: octeon: convert cvmx_pow_wait_t from typedef to plain enum
  staging: octeon: convert cvmx_pko_lock_t from typedef to plain enum
  staging: octeon: convert cvmx_pko_status_t from typedef to plain enum
  staging: octeon: convert cvmx_pko_port_status_t from typedef to plain
    struct
  staging: octeon: convert cvmx_pip_port_status_t from typedef to plain
    struct

 .../executive/cvmx-helper-util.c              |  2 +-
 .../cavium-octeon/executive/cvmx-helper.c     |  8 ++--
 arch/mips/cavium-octeon/executive/cvmx-pko.c  |  6 +--
 arch/mips/cavium-octeon/executive/cvmx-spi.c  | 16 +++----
 .../include/asm/octeon/cvmx-helper-util.h     |  2 +-
 arch/mips/include/asm/octeon/cvmx-helper.h    |  6 +--
 arch/mips/include/asm/octeon/cvmx-pip.h       |  6 +--
 arch/mips/include/asm/octeon/cvmx-pko.h       | 26 +++++-----
 arch/mips/include/asm/octeon/cvmx-pow.h       | 12 ++---
 arch/mips/include/asm/octeon/cvmx-spi.h       | 38 +++++++--------
 drivers/staging/octeon/ethernet.c             |  6 +--
 drivers/staging/octeon/octeon-stubs.h         | 48 +++++++++----------
 12 files changed, 88 insertions(+), 88 deletions(-)

-- 
2.43.0


