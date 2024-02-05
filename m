Return-Path: <linux-mips+bounces-1340-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A6784A5BE
	for <lists+linux-mips@lfdr.de>; Mon,  5 Feb 2024 21:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1309284187
	for <lists+linux-mips@lfdr.de>; Mon,  5 Feb 2024 20:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246DB17ED57;
	Mon,  5 Feb 2024 19:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IrR1GCGi"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A7717ED3E;
	Mon,  5 Feb 2024 19:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159860; cv=none; b=X2mduOnARwg2/ZTm4OAybTaWwtuLg1BIeXMQyhn/ynIpD3yWbpfZXH1n+gkWQdymPgNiclXf3+CVlg12JcmmyrgtBfyagnTyIF0UxzCYLffkbKTft4Wgw6Pe1KxSDLFJVs7S8OsyY6L4KoOJq1Yti1TFxX73YrQFqzTv+e6D4N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159860; c=relaxed/simple;
	bh=GWC/R9KnvqMqsuGJbyvLUE5rq9tD0443OWb0hB5RjH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJt4AHjGtlglzM1okzMDuT++35bO1qLZFnqHK/U4m3YRu311X2bEjwrpGxyk447Js+27wqqkWtP8MPOG1WdTQznOdapabfnrF5chJzWxslvD0kVufjdVRzjY0CQm/YeBnFgr8tqMaemECVtOwsheKiOdZw4j1XjQvvbrKF/bmFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=fail (0-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IrR1GCGi reason="key not found in DNS"; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB53C41674;
	Mon,  5 Feb 2024 19:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707159859;
	bh=GWC/R9KnvqMqsuGJbyvLUE5rq9tD0443OWb0hB5RjH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IrR1GCGiwB3VHXLh8IdqQ+YK+uzFscY6O+5W7MoIo0fmsSGQ2GLeDeJyILQyDyvXR
	 WR4FqB7xeKDJh0U7K7Q6xkydRRYAzpskWCwobKnk9+jNEBC50GHdItqOVQiNrXXlef
	 sNQZDzmcYllmZEzGkt39T0QPBsMrNavnMaOKIA3w=
Date: Mon, 5 Feb 2024 04:51:56 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mips: struct bus_type cleanup
Message-ID: <2024020550-mountable-grandkid-a4a9@gregkh>
References: <20240204-bus_cleanup-mips-v1-0-05af5e9a7ead@marliere.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204-bus_cleanup-mips-v1-0-05af5e9a7ead@marliere.net>

On Sun, Feb 04, 2024 at 12:06:56PM -0300, Ricardo B. Marliere wrote:
> This series is part of an effort to cleanup the users of the driver
> core, as can be seen in many recent patches authored by Greg across the
> tree (e.g. [1]). Specifically, this series is part of the task of
> splitting one of his TODOs [2].
> 
> ---
> [1]: https://lore.kernel.org/lkml/?q=f%3Agregkh%40linuxfoundation.org+s%3A%22make%22+and+s%3A%22const%22
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=bus_cleanup&id=26105f537f0c60eacfeb430abd2e05d7ddcdd8aa
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> 
> ---
> Ricardo B. Marliere (2):
>       mips: sgi-ip22: make gio_bus_type const
>       mips: txx9: make txx9_sramc_subsys const

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

