Return-Path: <linux-mips+bounces-11775-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C26BECFA0
	for <lists+linux-mips@lfdr.de>; Sat, 18 Oct 2025 14:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5402F4031CD
	for <lists+linux-mips@lfdr.de>; Sat, 18 Oct 2025 12:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458842727E0;
	Sat, 18 Oct 2025 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wp7t0Tsc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BDF185B67
	for <linux-mips@vger.kernel.org>; Sat, 18 Oct 2025 12:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760790910; cv=none; b=XoV9V/S6AZDYV6H1hwiacAFaDp0nCqNr3lrb/fM3PaZn8BtdTxsmso1W2aT7+bqnRzjb3ogq98txyZBwhXFVHnE5EyziESnmfQ25zB+wazUUQoZkDidmSGtsAxPdYGK75NhvlBlnDoqNEpbOJ/5OsOZqMZu7I5q7+UTRgzkjGy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760790910; c=relaxed/simple;
	bh=zubtkUp2yt3JEr+8+Hl4KpwF7FbZB+OQgzpUVKT1W0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/q9esiaNtlpTN7rMaVUgScBP2LXeK6HM/TA4d7rMvU6QMwOkv4wor55ZvMcT4cxup4DDJt4leaoQTOxtrKdsNmoTjc9hpk3OcGXgqN7eq9vRH5n4Zc944VfD/vH2C3vIJjzsgB+Qed72OPYd4qp/9hKlYVGlnBpk01O/06Q/xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wp7t0Tsc; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-290ac2ef203so27389725ad.1
        for <linux-mips@vger.kernel.org>; Sat, 18 Oct 2025 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760790907; x=1761395707; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LWHTNJbyaS31DH5v4N3tc7dWchDlomjozkszGkRyjQQ=;
        b=Wp7t0TscZzG3OeM19q2Mi4JyrsoEt5fbq7vdBt1XpmYo10h2bhXLVhBiBwgJpE2Eva
         EweYphIWtZYXXUECcmOORgKnsbYcOr7H8VPj/vRQFs69brxNFRAr5fumf1SH2c9rbeNl
         aJdWHDKkEire33uG2pAwfZf5ER1L44iR/3co1Pb3QOXn8/99VnvDNGMrVFsWXjY4gQvM
         WjsXPscT2ZBhMsIKpMxMPE1Q26w0BJnDv3pPU8oJFw9oACdrMUx7ookFbRiE9rfBidiu
         25RyrtRSjTnon13bG7aH9P2jQqZN2AaTRn0/ev+YZiWTvsYN5AH/+6n4ndMmtlm276Z+
         tvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760790907; x=1761395707;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LWHTNJbyaS31DH5v4N3tc7dWchDlomjozkszGkRyjQQ=;
        b=hnM3QDU8ls70OK2g+MIhhnrbhpI+8+jArSoRnKxSIurLKdQRGgFwroqy+be4z7ERD6
         QiU6MSwI4oaVO/i/BF6j2AXbXeMpsAjrvZIay4oX+64o+xQCKnjNiGnGJo+M1MOYUghm
         AvhnyBoJFZMquzAhfVrtPQrEwGNdNB249VFij3bb5EF4B32wCDwlFu5UZ9MPnLyfirzw
         XiCpeBvofNhe45mKowbo0Q7V4AQySg0uTQ9OuTp6JFq1TVv7m3Qh4ongEVgh9vl9/r8c
         gF1laF+tV7ki7rXLma+3LZcAWshBmIZmH+UFeS6Bq+D7Ld9abNhVBHG8WcGHnzASDE0Y
         D8Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUBckfqrTkO4TtbhtJ0uHoq/j0G5KBulyJChfRn8+SjS2CBUOhqlL6gVDIySPY23XTZcR3LlhKZgI6I@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw6sTUxfkedI88AUDNxILCR1nX5d4JT0HZRJWTkNpOYokZdKqC
	FTnTiyAKibBj5iZjPwynXgqBzzK+SggyDMwLXNTVZ7bUjOe2k95eV7wR
X-Gm-Gg: ASbGncuXGeJlCVrXl5Dey24krwCFwUEQZhkarS0oMCU8r+P8Te131tvE2OhN/qfBJ3j
	rA+cxEfKks6mvgtUf9dhaIIEM5xAUxui4Wj3aEfF+D8fMg9p356GXCFvgPrexDGKycey/eIVo7S
	zLv2BJ3tptS4fUoevDjT5L/io0+IcU3EdSuAadEE95JwLQpwz4yldTcpel2Vgg2quf2nQpfyN61
	kd/pojQ34h/HoUlDoFmIybBnxhtDS53wrw4HIgGHjSBXc4Aya8wx1+04kAB30QUh5e/jv3sHaxA
	Xj2vtMWMaCXHYEy7zHu2ehuN3joiMYTeyPpi3bQVCaAY4HANXvTaSH8Q9o/JeX2TlqBsq09lPqM
	c5ZGz32/3/yOZu49kUIvWUe3yHGVVl8PcdIvlIXNxy9CEDa3wlCQijXoR4S7hPHHdmbv+M5VPwX
	qy3QIBfHc5qE30
X-Google-Smtp-Source: AGHT+IH0Isbj1cOmj9B6RLl67WZWl/f5gDxBFTYoh/GDd4p0sblT1uv6SbNNW/CZV0z6mtaOmb0YQA==
X-Received: by 2002:a17:903:3d0d:b0:268:1034:ac8b with SMTP id d9443c01a7336-290d14e83cemr79158005ad.26.1760790906505;
        Sat, 18 Oct 2025 05:35:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d7e41sm25467105ad.57.2025.10.18.05.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 05:35:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 18 Oct 2025 05:35:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, "Maciej W . Rozycki" <macro@orcam.me.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] MIPS: Malta: Use pcibios_align_resource() to
 block io range
Message-ID: <8cdedbc4-4073-44a5-8ebf-2c8aa9da702c@roeck-us.net>
References: <20251017110903.1973-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251017110903.1973-1-ilpo.jarvinen@linux.intel.com>

On Fri, Oct 17, 2025 at 02:09:03PM +0300, Ilpo Järvinen wrote:
> According to Maciej W. Rozycki <macro@orcam.me.uk>, the
> mips_pcibios_init() for malta adjusts root bus IO resource start
> address to prevent interfering with PIIX4 I/O cycle decoding. Adjusting
> lower bound leaves PIIX4 IO resources outside of the root bus resource
> and assign_fixed_resource_on_bus() does not link the resources into the
> resource tree.
> 
> Prior to commit ae81aad5c2e1 ("MIPS: PCI: Use pci_enable_resources()")
> the arch specific pcibios_enable_resources() did not check if the
> resources were assigned which diverges from what PCI core checks,
> effectively hiding the PIIX4 IO resources were not properly within the
> resource tree. After starting to use pcibios_enable_resources() from
> PCI core, enabling PIIX4 fails:
> 
> ata_piix 0000:00:0a.1: BAR 0 [io  0x01f0-0x01f7]: not claimed; can't enable device
> ata_piix 0000:00:0a.1: probe with driver ata_piix failed with error -22
> 
> MIPS PCI code already has support for enforcing lower bounds using
> PCIBIOS_MIN_IO in pcibios_align_resource() without altering the IO
> window start address itself. Make malta PCI code too to use
> PCIBIOS_MIN_IO.
> 
> Fixes: ae81aad5c2e1 ("MIPS: PCI: Use pci_enable_resources()")
> Fixes: aa0980b80908 ("Fixes for system controllers for Atlas/Malta core cards.")
> Link: https://lore.kernel.org/linux-pci/9085ab12-1559-4462-9b18-f03dcb9a4088@roeck-us.net/
> Link: https://lore.kernel.org/linux-pci/alpine.DEB.2.21.2510132229120.39634@angie.orcam.me.uk/
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

