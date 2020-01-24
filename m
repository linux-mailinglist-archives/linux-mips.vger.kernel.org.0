Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE16148E8B
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jan 2020 20:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387775AbgAXTOe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jan 2020 14:14:34 -0500
Received: from fgw21-4.mail.saunalahti.fi ([62.142.5.108]:61259 "EHLO
        fgw21-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387683AbgAXTOe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 24 Jan 2020 14:14:34 -0500
X-Greylist: delayed 962 seconds by postgrey-1.27 at vger.kernel.org; Fri, 24 Jan 2020 14:14:33 EST
Received: from darkstar.musicnaut.iki.fi (85-76-133-190-nat.elisa-mobile.fi [85.76.133.190])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 81a963cb-3edb-11ea-bfc3-005056bdd08f;
        Fri, 24 Jan 2020 20:58:29 +0200 (EET)
Date:   Fri, 24 Jan 2020 20:58:28 +0200
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Matt Turner <mattst88@gmail.com>
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Alexandre Oliva <lxoliva@fsfla.org>, Tom Li <tomli@tomli.me>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] On the Current Troubles of Mainlining Loongson Platform
 Drivers
Message-ID: <20200124185828.GB29545@darkstar.musicnaut.iki.fi>
References: <alpine.LFD.2.21.1902180227090.15915@eddie.linux-mips.org>
 <orlg1ryyo2.fsf@lxoliva.fsfla.org>
 <alpine.LFD.2.21.1903071744560.7728@eddie.linux-mips.org>
 <orwolaw5u1.fsf@lxoliva.fsfla.org>
 <alpine.LFD.2.21.1903082347330.31648@eddie.linux-mips.org>
 <or7ead4lq3.fsf@lxoliva.fsfla.org>
 <20190610214938.GB7147@darkstar.musicnaut.iki.fi>
 <alpine.LFD.2.21.1906102253080.19418@eddie.linux-mips.org>
 <20190612192412.GF26504@darkstar.musicnaut.iki.fi>
 <CAEdQ38E4_eSm9VnHHJuV=qvQVWrGNOMvn0s8KEKaJT65vO77pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEdQ38E4_eSm9VnHHJuV=qvQVWrGNOMvn0s8KEKaJT65vO77pQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Wed, Jan 22, 2020 at 04:20:26PM -0800, Matt Turner wrote:
> Has any more progress been made?

I have given up using this hardware.

A.
