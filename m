Return-Path: <linux-mips+bounces-14474-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFGTEKKm+mm7QwMAu9opvQ
	(envelope-from <linux-mips+bounces-14474-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 04:25:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 984F24D5A6F
	for <lists+linux-mips@lfdr.de>; Wed, 06 May 2026 04:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3AD630086E1
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2026 02:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E96279DCA;
	Wed,  6 May 2026 02:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="XdOy04Ri"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDC71DF27F
	for <linux-mips@vger.kernel.org>; Wed,  6 May 2026 02:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778034312; cv=none; b=JQFedJqBFL7BmvyTfGjMAhQvRs3/x+OiXKH18sh3QQscLkjEQOJLi0qMZlqT7sAJAQE1bINEqIijfd48I99xw3rMPJbfAb4OrKZu35v1i8nZygwtxmctZwfHgHq2RJwYYRcA0im2WfXMBojanpspgEMC2YtpWMecI4mPLlKt11k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778034312; c=relaxed/simple;
	bh=I1lPHAVhik2/qZiEG/gjONNJ/Zs0mWlMF7PpuRBph8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PBaMpGSiY1NVoKeGR0yLDquhbzEub3YqaQQfmFcHGGEnn28bkJ3wVwmKED3zwKZs44mh8IrV4WM+KxaK/bQ2eMZGsomtN0eBA1oeZY0YAfFLz7bhBQwEhiCsvjzMTJ7G+78+cgheAdn1EMCuwE3De3vqnDZ981CSO+4Uit4OrkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br; spf=pass smtp.mailfrom=ime.usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=XdOy04Ri; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ime.usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ime.usp.br
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso1106224eec.0
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 19:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1778034308; x=1778639108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TK318sW2EU9DAUWZ70nTfCW0Y3oKpFjEiSuIXY+LKMM=;
        b=XdOy04RivZLAKZC/bzmRxLM1/P1wQgnlka1J7K6bbp4q0RnOWpBZbuPMBBC9nuoXEA
         OFrxdk8j/XrGn0WDok5hNImvF3Ay/Tle8M27VKgn2b2E43BE3dcrIq4ITqDxvUvaWx0c
         HdUEtC2nlwWwS6A2WPY+NNkJiFLCuwJSBZfPzyiCs+fyAQKy23R+BlycVV6va1cVntpd
         92Jq7fGpAUd+WU9Al2ovUDI862pe6Cb7Ui2ys+/CnIn0/fmJVMASee3UDuusZIO9PWm2
         kLLi4dvA94tu3jN0FSi2nkfd1IGb0lJoRboWjgkq5r1DKjpkkV7rv3CxOdi3PYLtAB5h
         QoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778034308; x=1778639108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TK318sW2EU9DAUWZ70nTfCW0Y3oKpFjEiSuIXY+LKMM=;
        b=Y+j3U0kzHgC9hmD9+mrm6E7Rh/luPcp8iFPRNbYbY4F99Gpl1utjrh9nKvKpfwb3le
         mgGsucwi/IBMZca+aVsh3oVQC4fOAYyJZs3juN3NWJKOGKN+gEECSEPjAxK809MxZxP5
         7bwHzpoQqTwM13qXYI0m0uHiALIB4NB8btTfoefp1c2M4Rj803xap/4Xj18Ic2pt/CdW
         Hf7Lc1MZSEsOwAhUx8eawtDzdlGNsRPU2Qh+Z9w+5CDO3KqDdKdluKX8RF+nRaiz/UyQ
         uL8eJVRWjvtgV59q/EnBHQlBj58BWekQEjkZ9nO2R75hk7ivrLJrC+3Vl4gtPSqlQE12
         k5DQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RaDorVP/nHRT0OYJDYbdBuSEtQMmXNdZItH2W4LpJ4XZE4ygI0rO9vyF7UHzo6w9f2emn6yGAuplZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxEAlah+9Cg1y+oBHU/zqMbCVBK4DxiKjd0NTl93eq4gSCSGJ35
	r6/UbC+SPNqN6UOxblxsfdQ0aXcGgrq/VqUK+N/X0mEap1zVBFSOqPw8ulg4coKvw80=
X-Gm-Gg: AeBDieszU8w1/E/OOu50fAGKqm6qvYNUW1UmK4dQIK6c1xQHUWNNJpnFr0UXMr+0YrE
	2GrhMrnbrE7mjrxjZ6eJOLyLWkMU1wtvBWOvs8Qoei4spvOw27zdjOkxY0TD4HmHe4vZZoR3Gk5
	tqi/I93qc9nfaEluYSgkdcXAK4FYqaPYkUI0YIbgMwwNKQpMEAe1ia9tqaxuJgN8CUguV+q+Uch
	JUe+bkzX0QUZVeRDMgqX5+8hFKaXt71OT0wvG5qXSHbRKgZiQgTe50DIlPgiYy1sOQ1Au+EVdii
	Un9V+FsZ4E9Xcw+b43e9t9qrpUwcW4zMbIg5eTfUjUz0b6V9rii+Ew1HTP/YR5e56W307oMmK65
	rTHDaSZtDrDy9hi94RFoQGIxuPALtgl8+zOlGFLC93y3WU1drOwBP1JvMOs+uSRhAmYoGXLG/8y
	4q25a9VyUhHozmL+yCKV5ljDnUb/pBGKSRv0cXhExEb1E9Og==
X-Received: by 2002:a05:7301:5781:b0:2f5:3641:f126 with SMTP id 5a478bee46e88-2f54a383b37mr876178eec.24.1778034308481;
        Tue, 05 May 2026 19:25:08 -0700 (PDT)
Received: from localhost.localdomain ([177.81.10.105])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56d5c3783sm1669552eec.11.2026.05.05.19.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 19:25:07 -0700 (PDT)
From: Felipe Ribeiro de Souza <felipers@ime.usp.br>
To: andy@kernel.org,
	dlechner@baylibre.com,
	jic23@kernel.org,
	nuno.sa@analog.com,
	paul@crapouillou.net
Cc: Felipe Ribeiro de Souza <felipers@ime.usp.br>,
	linux-iio@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH v5 0/3] iio: adc: ingenic-adc: use guard()() to handle synchronisation and refactor lock-held helpers
Date: Tue,  5 May 2026 23:24:27 -0300
Message-ID: <20260506022454.128169-1-felipers@ime.usp.br>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 984F24D5A6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[usp.br,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[usp.br:s=usp-google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[usp.br:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14474-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[felipers@ime.usp.br,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[usp.br:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ime.usp.br:mid]

In drivers/iio/adc/ingenic-adc.c:
- Refactor ingenic_adc_read_chan_info_raw() and ingenic_adc_enable_unlocked()
- Replace mutex_lock() and mutex_unlock() calls with guard()()

Felipe Ribeiro de Souza (3):
  iio: adc: ingenic-adc: rename ingenic_adc_enable_unlocked() function
  iio: adc: ingenic-adc: refactor ingenic_adc_read_chan_info_raw()
  iio: adc: ingenic-adc: use guard()() and scoped_guard() to handle
    synchronisation

 drivers/iio/adc/ingenic-adc.c | 68 ++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 33 deletions(-)

-- 
2.43.0


