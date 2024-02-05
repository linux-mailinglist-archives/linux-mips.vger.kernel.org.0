Return-Path: <linux-mips+bounces-1333-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB51384A5B2
	for <lists+linux-mips@lfdr.de>; Mon,  5 Feb 2024 21:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51D071F26D9C
	for <lists+linux-mips@lfdr.de>; Mon,  5 Feb 2024 20:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A4A17E4AC;
	Mon,  5 Feb 2024 19:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xR4zBRGH"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE80C17DD70;
	Mon,  5 Feb 2024 19:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707159859; cv=none; b=SbrF2ez0rAlDpO+cjnp18ljbBa4qWPJ7259mVJrXUEsctdNnU54V6MMyiI36ecLMqxih2gr9FCogdNdhnZgdcoPS9KTByeGhG+ffzq+dXe0dUn2baSZIJ6J3vcb/cOtt0CdEd0tztjBMg/efCmyWW4Z8cC3SPkS+9ROF5GspcCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707159859; c=relaxed/simple;
	bh=GWC/R9KnvqMqsuGJbyvLUE5rq9tD0443OWb0hB5RjH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktNBOHkVwBQKg0xBxM5FygSR4Dp/cP9Own6AXV+c+kkTxv7VJe6zfyG2nRdYNWTU61k0UZd1mOZf6RNQuwAa7Z/eNYcHpXxEY+jFuQOUmLon4ek4rwFcImHUNqmDCuZmwI4bVM5rwD4yOEQy0GlwyAJ8iKLzfU0Q7WGD0Em7jbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=fail (0-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xR4zBRGH reason="key not found in DNS"; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81905C43390;
	Mon,  5 Feb 2024 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707159858;
	bh=GWC/R9KnvqMqsuGJbyvLUE5rq9tD0443OWb0hB5RjH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xR4zBRGH0zOMK562U+gNhnTReobSEJ128SRI4QX130rDPfvzTwR8EOlOB6EbRG5mx
	 VWLt2FOsMbkqM3OGFXXZT47GuZ/vwK9g+mZkQWb/Lk89MC96nollzA/+su+4R+9qPk
	 U4ZoAxVqLAnUYREZ2TkZlGmLNp7RM7m+JuyFkkEA=
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

