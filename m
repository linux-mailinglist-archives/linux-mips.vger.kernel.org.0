Return-Path: <linux-mips+bounces-9861-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D802FB0A956
	for <lists+linux-mips@lfdr.de>; Fri, 18 Jul 2025 19:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 910FA3BE06B
	for <lists+linux-mips@lfdr.de>; Fri, 18 Jul 2025 17:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C912DCF4A;
	Fri, 18 Jul 2025 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqXalVmJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA9A4503B;
	Fri, 18 Jul 2025 17:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752859500; cv=none; b=CKgsF2Kif/lH44F5ZPfkhs46G9ntyy8lYPsaq6xNYQgd/mFNmdtFy7DDenao/RvnDTPjzGFNmgC7GMWhDMltB00Na2UXoCy/2NYsNEPntjcxoPxAziTd+aUspI+Q6C+1tGt/7QtzP6Ue2R1Qe8DE8QoFWs0VCdIirb4V0lGzSIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752859500; c=relaxed/simple;
	bh=oVO5M0xi9nHuF2wLV5lZIwV9zZTHFOJINcZiTfuxVMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4j8BUQy0V2z9yIKYYTDtg9VkHK+uukxHy+8437AbmxM3/CDcmV+yU+WcRZleNWKCyDzubpIdAILJrJpdmtb52ske9eBDHbKwZTNQQr2wl59RRE3BUC69cEBIscbmKAGnBDx0gw+uN9Ujx8Ew6I2XG9us00ETkBBoBZ1hoA4N9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqXalVmJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4F1C4CEEB;
	Fri, 18 Jul 2025 17:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752859499;
	bh=oVO5M0xi9nHuF2wLV5lZIwV9zZTHFOJINcZiTfuxVMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqXalVmJ44i3C1Q1lZX+O1wEI6wKjOoYPZ1t3bA8aoZ2FUaaVn3QiCetoUYw7m9z2
	 RnNt7q1ghLvXnreglbMakN+S+6i6Vo+Md/+RfrIEBGMIB3L0YjMvj7rjIHAumcK1R9
	 9caF4FditaprdNNusCfs1NjwrfpNJnd/1ABK79IzRnS/ijirZpAaAnWMd1bbUUmOY/
	 InjU+kV49p8Rn7kLevtJg+PcO8UqEbXm0VB38B+flHprmY7HaLtWIboKpi5+0S7CSL
	 I9eCKxE6pjSGWTgkub5pwV3502DeVWGGS78Y7zaHCRhdOWlOVrZz84wsLygXKNFy48
	 ldVY1/Ozd/Ctg==
Date: Fri, 18 Jul 2025 10:24:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 00/26] SHA-1 library functions
Message-ID: <20250718172457.GB8845@quark>
References: <20250712232329.818226-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>

On Sat, Jul 12, 2025 at 04:22:51PM -0700, Eric Biggers wrote:
> For 6.17, I'd like to take patches 1-15 at the most.  Patches 16-26
> would be for later, and I'll probably resend them individually later for
> subsystem maintainers to take.

FYI, patches 1-15 have been in linux-next (via libcrypto-next) since
earlier this week, with no issues reported.  So I will include those in
6.17.  I'll resend patches 16-26 later for 6.18.

- Eric

