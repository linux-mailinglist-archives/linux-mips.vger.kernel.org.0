Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B39C30D9DC
	for <lists+linux-mips@lfdr.de>; Wed,  3 Feb 2021 13:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234161AbhBCMfT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 07:35:19 -0500
Received: from elvis.franken.de ([193.175.24.41]:49652 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234220AbhBCMfR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Feb 2021 07:35:17 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l7HMi-0006rA-00
        for linux-mips@vger.kernel.org; Wed, 03 Feb 2021 13:34:36 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F0449C0D4A; Wed,  3 Feb 2021 13:34:25 +0100 (CET)
Date:   Wed, 3 Feb 2021 13:34:25 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org
Subject: KVM Guest
Message-ID: <20210203123425.GA9574@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Does kvm guest kernel still work ? I'm playing with current mips-next
and starting a kvm guest kernel inside an emulated malta system also
running a mips-next kernel. The kvm guest kernel starts, but hangs
in calibrate_delay (at least that's what info registers in qemu monitor
suggests). Ayn ideas ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
