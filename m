Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF1AA2D0B41
	for <lists+linux-mips@lfdr.de>; Mon,  7 Dec 2020 08:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgLGHqH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Dec 2020 02:46:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLGHqH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Dec 2020 02:46:07 -0500
Received: from orcam.me.uk (unknown [IPv6:2001:4190:8020::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A0865C0613D1
        for <linux-mips@vger.kernel.org>; Sun,  6 Dec 2020 23:45:26 -0800 (PST)
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id D55892BE0EC
        for <linux-mips@vger.kernel.org>; Mon,  7 Dec 2020 07:45:25 +0000 (GMT)
Date:   Thu, 19 Nov 2020 13:42:18 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
cc:     Fredrik Noring <noring@nocrew.org>, linux-mips@vger.kernel.org,
        Andreas Jaeger <aj@suse.de>, Nick Clifton <nickc@redhat.com>,
        =?UTF-8?Q?J=C3=BCrgen_Urban?= <JuergenUrban@gmx.de>,
        libc-help@sourceware.org
Subject: Re: [PATCH 002/120] MIPS: R5900: Trap the RDHWR instruction as an
 SQ address exception
In-Reply-To: <alpine.LFD.2.21.2011191241410.656242@eddie.linux-mips.org>
Message-ID: <alpine.LFD.2.21.2011191340430.656242@eddie.linux-mips.org>
References: <cover.1567326213.git.noring@nocrew.org> <4f856a5ea2c039c6639df875d11b5bff1bf7ecd2.1567326213.git.noring@nocrew.org> <2767f5c3-4e89-6543-34f7-6cd1a1be8c23@amsat.org> <alpine.LFD.2.21.2011191241410.656242@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 19 Nov 2020, Maciej W. Rozycki wrote:

>  Consequently an AdES exception is triggered which we can trap and handle, 
> reinterpreting the encoding according to our needs and return the TLS 
> pointer in $v1 rather than issuing a SIGBUS.

 ... while keeping regular SQ instruction use intact, I should have added.

  Maciej

