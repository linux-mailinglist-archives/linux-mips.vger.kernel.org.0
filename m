Return-Path: <linux-mips+bounces-79-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0D67EC971
	for <lists+linux-mips@lfdr.de>; Wed, 15 Nov 2023 18:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04F7D1F26C2F
	for <lists+linux-mips@lfdr.de>; Wed, 15 Nov 2023 17:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11BB28387;
	Wed, 15 Nov 2023 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzXjoF/W"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBDF28384;
	Wed, 15 Nov 2023 17:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC51C433C8;
	Wed, 15 Nov 2023 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700068269;
	bh=vlsYtScBbAr4UMoA0iR2Mneor4acUxG23D75vzElABo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzXjoF/WMJal17q+ByRWz+qs8gIzdTE3oFcPdUTGO5Dbtk/mRUxx5op6X1uMSGNGO
	 AtDR0Zxt6AlonWztG5UeNiftH5uWJ5Kl0/AJc9HJ0GoG6V0yspBcn+vpO/pGzu+ZxD
	 aqfG2y3sCh7dKcRGbh2M4UXdTr3lJ39GmqRSLUop+OKbfhwCmUw5cnkPNiIV2oCjxm
	 3+222+dJ8cbY3lO9NoFuVNMW1iS3ZXyrmHifEoDs6pMLxeGhme/Qn1t4bAqSCdP2QY
	 REC/CHMf4Sp0QHjRxJBnMBund3obUwo3GrBUW1ERj/dfdbWmZXbn/iTjlxUwinRcxm
	 JlTr65BKQQjEg==
Date: Wed, 15 Nov 2023 17:11:05 +0000
From: Simon Horman <horms@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
	netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] stmmac: dwmac-loongson: Add architecture dependency
Message-ID: <20231115171105.GS74656@kernel.org>
References: <20231115115331.19eb0c24@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115115331.19eb0c24@endymion.delvare>

On Wed, Nov 15, 2023 at 11:53:31AM +0100, Jean Delvare wrote:
> Only present the DWMAC_LOONGSON option on architectures where it can
> actually be used.
> 
> This follows the same logic as the DWMAC_INTEL option.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> Changes since v1:
> * Enable build testing (suggested by Simon Horman)

Thanks for the update, this version looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

