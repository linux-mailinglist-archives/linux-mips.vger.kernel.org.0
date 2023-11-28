Return-Path: <linux-mips+bounces-299-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638B7FB55C
	for <lists+linux-mips@lfdr.de>; Tue, 28 Nov 2023 10:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4232A282614
	for <lists+linux-mips@lfdr.de>; Tue, 28 Nov 2023 09:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AADE3DB8C;
	Tue, 28 Nov 2023 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B0BACC;
	Tue, 28 Nov 2023 01:14:58 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1r7uBE-0007T6-00; Tue, 28 Nov 2023 10:14:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A4070C0136; Tue, 28 Nov 2023 10:00:24 +0100 (CET)
Date: Tue, 28 Nov 2023 10:00:24 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Wujie Duan <wjduan@linx-info.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Mark symbols static where possible for mips/kernel
Message-ID: <ZWWsKBmjMKYZtWpu@alpha.franken.de>
References: <20231128071225.801111-1-wjduan@linx-info.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128071225.801111-1-wjduan@linx-info.com>

On Tue, Nov 28, 2023 at 03:12:25PM +0800, Wujie Duan wrote:
> We get 1 error when building kernel with -Werror=missing-prototypes

check git grep setup_sigcontext arch/mips/

With this patch n32 support doesn't build. We need a prototype in a header
to fix that.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

