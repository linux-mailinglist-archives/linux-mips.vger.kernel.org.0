Return-Path: <linux-mips+bounces-541-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DE9805166
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 12:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8398B1C20A9E
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 11:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562A94C63F;
	Tue,  5 Dec 2023 11:00:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id E4C6F116;
	Tue,  5 Dec 2023 03:00:32 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rATAC-0000XE-00; Tue, 05 Dec 2023 12:00:28 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 26F26C0A1E; Tue,  5 Dec 2023 12:00:15 +0100 (CET)
Date: Tue, 5 Dec 2023 12:00:15 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@rothwell.id.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/20] mips: address -Wmissing-prototypes warnings
Message-ID: <ZW8Cv8ck9JoyLuLi@alpha.franken.de>
References: <20231204115710.2247097-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204115710.2247097-1-arnd@kernel.org>

On Mon, Dec 04, 2023 at 12:56:50PM +0100, Arnd Bergmann wrote:
> The patches could either go through Thomas's mips tree, or
> alternatively through linux-mm along with the hexagon patches
> that Andrew has already merged.

I'd prefer to have in MIPS tree to also fix the other missing pieces.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

