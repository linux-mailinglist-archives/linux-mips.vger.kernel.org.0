Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62AA11729FE
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 22:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729685AbgB0VQY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 16:16:24 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:53162 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgB0VQY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 16:16:24 -0500
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23991224AbgB0VQVit99E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 Feb 2020 22:16:21 +0100
Date:   Thu, 27 Feb 2020 21:16:21 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     linux-mips@vger.kernel.org
Subject: Re: MIPS Hardware support
In-Reply-To: <20200227144910.GA25011@alpha.franken.de>
Message-ID: <alpine.LFD.2.21.2002272106360.3609189@eddie.linux-mips.org>
References: <20200227144910.GA25011@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

 My remote lab was offline until last Fri, which limited my verification 
with the latest kernels.  However I have live hardware of the following 
types and I intend to keep it up to date with Linux, and possibly still 
expand support as time permits:

> DECstations (MACH_DECSTATION)

 Several systems of different types, R3k and R4k-based.

> Loongson-2E/F family of machines (MACH_LOONGSON2EF)

 A pair of Fulong Loongson-2E machines.

> MIPS Malta board (MIPS_MALTA)

 A 5Kc-based (64-bit) Malta machine.

> Sibyte BCM91250A-SWARM (SIBYTE_SWARM)

 One system of this kind.

 I have no idea about current QEMU support, but certainly Malta used to be 
supported with various processor types.

 HTH,

  Maciej
