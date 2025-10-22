Return-Path: <linux-mips+bounces-11849-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB32BFB8D2
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 13:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 134C5420B15
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 11:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B8D314A93;
	Wed, 22 Oct 2025 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYr95C9I"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD1A301002;
	Wed, 22 Oct 2025 11:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131331; cv=none; b=TbBO6Oeae0luByypaDqqgJHPtUyU9ePIQHHI3+YcqVfylaVLyOnIv0Xtv01TJr51A+NlvD1nO7hbf36x6KHLPR+U3dBPT6Dt7UOmzzNOVCJ63dMCXZnXfvRLssfA5o2EwA0aCeaFqImJRR+gF/8HSynmKMIBIdiT2GFD35HsUfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131331; c=relaxed/simple;
	bh=ZAOA8Sq2UzSr/xWemGA8q+wo44isUSrk/K/xVt8gVqA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WgsCN6I2cNllTXc7QAOzQd7zeUKgvMWHkfF20KZ1Nd4+5cZsEv32FuYRlV9/6tpGSg45R3/ALUYYOGcSJLkuuKFeLprZ8g8ug9x4ELglqeuc0Ir2uKjJgYBknbef5uYY/o3O+UoA7+gr/PV8p5lK5gcdwY7mHWi6yPJnBBz22aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYr95C9I; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761131330; x=1792667330;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=ZAOA8Sq2UzSr/xWemGA8q+wo44isUSrk/K/xVt8gVqA=;
  b=TYr95C9I3qu3cXm0t41BDTgmXOoc8XAQOrR4a3bQwGvIDHP67VroPbWc
   GEYr9xWvi0ajU/4zZc+Ue64F8SHEViFZfa6cq1xHXy8eQ7rimT5tsV1EZ
   I5Xyspv/gqhrZYu7BaChDLJaPSHBIVHs5+2FUQBrcke48o/6XVr6688AY
   FKGF5MK2Lc/fQvtFfFDG9SsE7hO6/aLBUbO5ZLkdFbgZOdo6khf4hg09W
   a0iaCrqJZmGQKLHX3OGNpdPCikEgg6GO17TK5uPpDQ02K/WFN100Ozmzi
   JowXtLmHpUCKvrK5lA2QTdqK/MGtUC65K5/6miD04yfsuiKi+c/x1qlFR
   A==;
X-CSE-ConnectionGUID: YF5Gxc3cQXClc756XgBMxQ==
X-CSE-MsgGUID: yJA24LK9QN6dEYLJC2A4YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62303801"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="62303801"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 04:08:49 -0700
X-CSE-ConnectionGUID: 5jKxRB+bQUKaxs4FjT6r6w==
X-CSE-MsgGUID: Iztf2IDtQLWVEVHghxVLrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="187884681"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.82])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 04:08:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 22 Oct 2025 14:08:43 +0300 (EEST)
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
cc: Bjorn Helgaas <helgaas@kernel.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Bjorn Helgaas <bhelgaas@google.com>, linux-mips@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] MIPS: Malta: Fix PCI southbridge legacy resource
 clashes
In-Reply-To: <alpine.DEB.2.21.2510211901530.8377@angie.orcam.me.uk>
Message-ID: <93ffa5d8-61eb-abdf-8271-8f676d36fe56@linux.intel.com>
References: <alpine.DEB.2.21.2510211901530.8377@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-306951886-1761131191=:1437"
Content-ID: <f9f506e3-2e99-e3d3-7244-be1d23408eb3@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-306951886-1761131191=:1437
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <a7fbe9a5-5107-7a1f-de83-9c88a7b19da0@linux.intel.com>

On Tue, 21 Oct 2025, Maciej W. Rozycki wrote:

> Hi,
>=20
>  This mini patch series sorts out issues with southbridge legacy resource=
=20
> management on the MIPS Malta platform.  Two changes turned out required,=
=20
> because merely removing the clash would regress the PS/2 interfaces, fixe=
d=20
> by accident with the PCIBIOS_MIN_IO fix.
>=20
>  This does prove nobody has used these interfaces since forever, or most=
=20
> likely since the move to the new serio driver.  Things most likely worked=
=20
> fine with 2.4 and I still have such old Malta kernel builds lying around=
=20
> (though sadly no hardware to try with), although I do know I've never use=
d=20
> the PS/2 stuff with this platform, e.g. quoting an arbitrarily picked=20
> 2.4.19-rc1 bootstrap log:
>=20
> CPU revision is: 00018101
> Primary instruction cache 16kb, linesize 32 bytes(4 ways)
> Primary data cache 16kb, linesize 32 bytes (4 ways)
> Linux version 2.4.19-rc1 (macro@macro.ds2.pg.gda.pl) (gcc version 2.95.4 =
20010319 (prerelease)) #1 Fri Aug 23 02:55:02 CEST 2002
> [...]
> parport0: PC-style at 0x378 [PCSPP,EPP]
> initialize_kbd: Keyboard reset failed, no ACK
> Detected PS/2 Mouse Port.
> pty: 256 Unix98 ptys configured
> keyboard: Timeout - AT keyboard not present?(ed)
> keyboard: Timeout - AT keyboard not present?(f4)
> Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ DETECT=
_IRQ SERIAL_PCI enabled
> [...]
>=20
> However to prevent the PS/2 interfaces from getting fixed and then broken=
=20
> again with backports in a random fashion I have marked both changes for=
=20
> backporting as appropriate.
>=20
>  Bjorn, may I request that these changes be placed, with Thomas's ack of=
=20
> course (hopefully a formality), ahead of Ilpo's commit 16fbaba2b78f=20
> ("MIPS: Malta: Use pcibios_align_resource() to block io range") (or=20
> whatever the latest version is, as said commit seems to be missing tags=
=20
> updates you mentioned), and then merged via your tree?  That will prevent=
=20
> things from breaking just to be fixed again shortly, and overall getting=
=20
> out of sync.
>=20
>  See individual commit descriptions for details.

FWIW,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.
--8323328-306951886-1761131191=:1437--

