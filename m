Return-Path: <linux-mips+bounces-9257-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9FAAD5A0B
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 17:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13F8E3A7349
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 15:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5000920127D;
	Wed, 11 Jun 2025 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kgd+Vblx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613F91FCFE2;
	Wed, 11 Jun 2025 15:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654738; cv=none; b=ls3fgqyeWcvCsNPoATTI1RDaKMUP7BA7+sUC9N/TP0qHCZuGIIPdWTZaIE3FP4tCNSd1CS6cdmQIMeQlN7anaTb7iBfQa1r23whChZbvCa/N8+CzsNb3vqSWjsYWs8LworDr6dL075hoISXfyIam8MahQucAJfq5puSHUMY70k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654738; c=relaxed/simple;
	bh=w50J13DoDa3ztdz0aJJJjIaFHSClneyL/iYpIIag/qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avk6j+j3Pm7PazoWSrPYpojowSA6RUOGwgCtkzpH2enOJpVC04WgWcOVZ5yVH7RgtzxirLNcgrz3V63xF5b0p8Mthdn3o0W0CqKm1MZpE81xrAoqKqM0gKPtBZI/OVB+G9KGtU2x3ZCYws7M3Yn+oEv5Ut2/w9H+KXL19RcnLVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kgd+Vblx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749654737; x=1781190737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=w50J13DoDa3ztdz0aJJJjIaFHSClneyL/iYpIIag/qs=;
  b=Kgd+VblxihFI310XgdLAOWXQbVvaedBb5LDTfigC73D8zc2a4K+JcIou
   yPU8zyCLmbNolyqnySLo5EIZY/+VqufEVBF7AwnPLyxrzCH4Rz12S21Wm
   4SChe6Sfvii/y9FnST34uTvxCXt3dk4jGXS6sv/fqv8H1Xs7CxLH2Jm4I
   fxTIAevHVJiLIKWa3SxzdrDc3jCHKGMZwsj3KYfMEzolc2nqT3tMMTe15
   ML+JmA5c7UzEk6Gr0TGjOXNMIznVXZDy5AfGtMtow3N2AQQNF5ryp+M14
   1DhPNYjHjEajJgpNJQV97ahCHx0OPWvggXcXoG2p1C072xwkzNXSSz8cJ
   A==;
X-CSE-ConnectionGUID: b7ZwbKNXSxKanmVOnYG4gg==
X-CSE-MsgGUID: Ax1Qv9TkQE2nwWoXsLIK7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62083554"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="62083554"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:12:16 -0700
X-CSE-ConnectionGUID: y29W/3r0RkKpTtbZaK2+RQ==
X-CSE-MsgGUID: h+7CkrccS1exPpWmkCy9FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="184427637"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:12:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPN7X-00000005gGG-2dL9;
	Wed, 11 Jun 2025 18:12:07 +0300
Date: Wed, 11 Jun 2025 18:12:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/33] serial: 8250: sanitize
 uart_port::serial_{in,out}() types
Message-ID: <aEmcxySiXun--YZs@smile.fi.intel.com>
References: <20250611100319.186924-1-jirislaby@kernel.org>
 <20250611100319.186924-9-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611100319.186924-9-jirislaby@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jun 11, 2025 at 12:02:54PM +0200, Jiri Slaby (SUSE) wrote:
> uart_port::{serial_in,serial_out} (and plat_serial8250_port::* likewise)
> historically use:
> * 'unsigned int' for 32-bit register values in reads and writes, and
> * 'int' for offsets.
> 
> Make them sane such that:
> * 'u32' is used for register values, and
> * 'unsigned int' is used for offsets.
> 
> While at it, name hooks' parameters, so it is clear what is what.

At a glance this looks just mechanical change. Have you used coccinelle for
that?

As for the whole idea, I like it,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

...

> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>

These also can be moved under '---' :-)

> ---
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---

-- 
With Best Regards,
Andy Shevchenko



