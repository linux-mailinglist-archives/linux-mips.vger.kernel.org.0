Return-Path: <linux-mips+bounces-14554-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHRSK+D1AmqvzAEAu9opvQ
	(envelope-from <linux-mips+bounces-14554-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 11:41:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5332251DF29
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 11:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B92B300917B
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 09:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708DE4BCABE;
	Tue, 12 May 2026 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHKCncOJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9732228A3F8
	for <linux-mips@vger.kernel.org>; Tue, 12 May 2026 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778578888; cv=pass; b=uk/3Vsq1+mF36uTH5X8wjTl+brG6joH9ADvF9W3DSdDySsEl1rOWOLcCpj1t+ypNZ0WVdj5eHW83NoYAynmhY0p4VL8LXb/Z+AtYD6+2Th5GCvaNBlfhkpeGa/v+GzECVqO+chyoBZLts3EG0WaurgD2hUJOP9FnBCNo/CiOgXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778578888; c=relaxed/simple;
	bh=CxgWcjDmdj2Hu0n71rBBU23N9TUkA+jM8Iyk4mcFdDk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dvtOEjdvKFn2/fMiPAT9T03SQBcN2J5dSC7V6Db0aZ1hc4B14bPvIQO4D5HTJK7FtegZTh8Q3PkgfF8Q7N+77xlNnRd0yJTX7D5QPGhdS1i2hlNWlWYAYeASyDbSINLElxMAGCz2vMvJGXLb8+MdJd80MeFSVTa2jbySnFjS+WM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHKCncOJ; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a8d648466bso2277931e87.3
        for <linux-mips@vger.kernel.org>; Tue, 12 May 2026 02:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778578880; cv=none;
        d=google.com; s=arc-20240605;
        b=HNh60FrBD1xS80pqUFcFvVgWpoRL5MHrvtCDLNBPXBC7QO5drbdrM6lJmJLPCP1HPI
         q6R5vAbd3MbbpEm8MkPtzuCifpu1O7KzP2ZYb0P2BPxyXmsgMjvv+TWJ5QldMiG3xqUs
         uFT4oDT2IEaIwWBx1Un5VczCdnv8zdZgwIOm0FO+AHCKQYPDGoIMsJ9Fcmtcs35lZLzI
         gaEoIE4FLHycHCC1XziNEVZri8GrJc0wVDeKBbmDslRv/0c45tnYIRhIOoO7WRF5KQ1k
         0fa1kRaOMe9ml59wj5PefABP8IzqhCgU5hpOuYlwr4DLTstXlU29lBqwuvrIGsqEI22S
         raMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=X1DjcPB+x5548cy33WrtAXvXzmpcqjg9oduXqqi7c8k=;
        fh=1RUBv7CFYdwP2tvUWlBftGnBa1Hme5iaMKBzNAczFAc=;
        b=jqJTdLKC1hvS2Kp1cJi6sDnPf+r4SjTDhjbdvyiZqO7GxGtvp73nAdvyU/NlZfwZ+T
         636yBgWyIR/LhOEffM94IuQXy2jm87c6Ddq4uSXi6xxUsPf9NFIGXMADyfOrcdCfBYsB
         lP8kvAPpWRcLyprF8j1Bnxnl0z+XaWRkIm2t1h/gyvSJQETdMN2UXpWupGNNnd0tIfpi
         nh7TmVdbi+3cEb90+JgqV+lCPzI9U/IwRnOzL0BTmrJ2GA+eGLeQ8zZuUqlPh58geKES
         EYRLvFQecNwj2ainhRkgNdq2pYSAJZ2/1vg6NCmhvt+oMyJeMb4Oeb22pA7cEZOzoLuo
         tL6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778578880; x=1779183680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X1DjcPB+x5548cy33WrtAXvXzmpcqjg9oduXqqi7c8k=;
        b=BHKCncOJXh+G4T9LvOE7yRHRpAs769ok5HiaUxZYJlWBj5ffQYYy5L+keD8AIt5dG5
         rfjPWtSbrB0d9DZR9CVDnf5aIr45ZNtF9FYKRpHGQXyLi2pNU0U4es1CmMU68P/1kYIn
         BJhOXn1RzDlkgXtP0nEL1zhr7BtAEa+amje8DEvPEtDayXsW7lCsFtjqlQqgHS5AkMog
         HR2HV25tMpwtAkWyBfx72Y/1tyQ20fHp2AxsD9q4hyRMAkkBuYb0mNoKMfxDoEUWG15p
         kt08l1M1OgdrNpsp/Shcnbjaipc+g3ed9nRtJNjLgx7rptvNMHHinoNPV4dAk7fXS2k6
         2DSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778578880; x=1779183680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1DjcPB+x5548cy33WrtAXvXzmpcqjg9oduXqqi7c8k=;
        b=a6tHtezAIsSf7ZF53ikrwE2VnTxKYjH3IsDNT90El1rforZn4/KHudzF/IXDwHONdD
         cM1qCR88cTgn3pDScUluzqyP0PTmIaKaptXyDewfA6dy2Kh89QY5BvYaYrVLnY6p2UL5
         Mo+J/nH6oqM9V4oSrNP1B2CM2BKkhzTnkNanJUcnufK9UhXDEGtwfqzWc0b6TgMA55DP
         l0JIKSVLDcLjvKMJzXM4VXk7Vy3yoO/i3VLjWw5dQI9eqa+NPecyfCcotnt1xB0/J4/R
         gNIu0CCQx9ierfBCxw9LVmY8MG2smZybmqA7QgHqHDv61m+Sgk8O/T2n8icTq6+fHFFs
         E/Cg==
X-Forwarded-Encrypted: i=1; AFNElJ803ChmvGVM99+bNJzjYfBNltVvjsUA+ol/JGyS8lACVf/JVZ94kEQBEyGvqMI9bV6fufKQKwAQXYmy@vger.kernel.org
X-Gm-Message-State: AOJu0YxA128WZ3muTr/67sj5JUY9ZHGlFxfXKO445WYNRhjXsklt8adt
	nx7ph3027xHRCc9mZFSLe84o1Sc971O0c/3qfq5aAphPdjA+z3szJ9jGMrndLfJQzMzpMzNRu4j
	bnqRHdQcnu3HgwCyNrHZUFCgnuVuLGA==
X-Gm-Gg: Acq92OE3hBVFLQI0OIG9ZaI0gjuJheOGlMKbHUw5o3Z3keCgZdSb8FYHn4YaQ+1DRlF
	xFDY7WnAXduslX8QAtzog5AaFBE+KQgbsZpuMoYXNKqTTuscjgTS8Neo6qNoi9c05KTQHfc9nfI
	Bdb0GYM463WORuPrg6JrfYjxRZEElkaSy6SGNgNGcSbDri1tnRk6JZynSSYGkYDtd+gPXFOdTIW
	J7oNvCCprwT4Wgtwy+dpue4QrDkalE82n5z5SKDRgxHup0aJqKSm9BWXaGDKSfG5tP4fYi8Ai9f
	OSPLzbgoYTG0tQ==
X-Received: by 2002:a05:6512:6892:b0:5a8:e336:b55a with SMTP id
 2adb3069b0e04-5a8e336b578mr524122e87.7.1778578879993; Tue, 12 May 2026
 02:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alessio Ferri <alessio.ferri.3012@gmail.com>
Date: Tue, 12 May 2026 11:41:08 +0200
X-Gm-Features: AVHnY4J9BtuNrlXrKJHpLo2TWKcy7O4i3-dSbIPoGPt0FBdFML5e0k-WaTjkZrI
Message-ID: <CAHDv23WJLBEp3ETscVT4Z6E5PQfzTDcofxbZ6jAezZNYde7C0w@mail.gmail.com>
Subject: bcma: endianness problem chipcommon access soc bcm6362
To: "zajec5@gmail.com" <zajec5@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5332251DF29
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14554-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alessioferri3012@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Rafa=C5=82,
Sorry for the multiple emails, having trouble sending plain text with gmail=
.

I am working on an OpenWrt port for the D-Link DSL-3580L (BCM6362 SoC,
big-endian MIPS host, 4352 variant mini pcie for ac).
project here https://github.com/aleferri/openwrt-dsl3580l
While testing I ran into an endianness assumption inside bcma.
It uses readl()/writel() everywhere, which uses "device little-endian"
convention
they go through le32_to_cpu(), so on a BE host they swap bytes.
But on this SoC the AXI bus is big-endian, so readl() swaps them and
bus scanning sees garbage.

Evidence from a small diagnostic ko module that i asked claude to
create, dumps the SHIM at 0x10007000 and the AXI chipcommon at
0x10004000 side by side:

  axi  @0x10004000 +0x00 CC_ID      readl=3D0x62630122  ioread32be=3D0x2201=
6362
  shim @0x10007000 +0x18 (CIA)     readl=3D0x0100f84b  ioread32be=3D0x4bf80=
001
  shim @0x10007000 +0x20 (ADDR)    readl=3D0x05400010  ioread32be=3D0x10004=
005
  shim @0x10007000 +0x2c (ADDR)    readl=3D0x05500010  ioread32be=3D0x10005=
005
  shim @0x10007000 +0x38 (ADDR)    readl=3D0x05700010  ioread32be=3D0x10007=
005
  shim @0x10007000 +0x3c (EOT)     readl=3D0x0f000000  ioread32be=3D0x00000=
00f

The BE column seems correct:
  - chip id 0x6362 in CC_ID
  - CIA entries with Broadcom vendor 0x4bf
  - ADDR descriptors pointing back at the expected core bases

The readl() column is just the same words byte-swapped, which matches
what I observe at runtime: bcma_bus_scan() fail to scan with -88

The relevant call sites are:
  - drivers/bcma/scan.c
      bcma_erom_get_ent()  -- readl() directly; this is the function
where bus scanning breaks immediately
      bcma_scan_read32()   -- readl() directly

  - drivers/bcma/host_soc.c
      all read*/write* ops use readb/readw/readl / writeb/writew/writel

I don't know how to disambinguate at runtime as scan.c reads the data
before the chip id is known, so a runtime quirk based on the chip id
is not workable.
Maybe if the endianness is known at bind time with a standard property
in the DT the bug can be fixed while leaving the default as is

Happy to test patches on the device, or i'll send an RFC myself if
you'd rather review some code.

Thanks,
Alessio Ferri

