Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0062FA5BF3
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 19:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfIBRvq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 13:51:46 -0400
Received: from emh07.mail.saunalahti.fi ([62.142.5.117]:33488 "EHLO
        emh07.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfIBRvq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Sep 2019 13:51:46 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-83-161-nat.elisa-mobile.fi [85.76.83.161])
        by emh07.mail.saunalahti.fi (Postfix) with ESMTP id DF51BB0335;
        Mon,  2 Sep 2019 20:51:42 +0300 (EEST)
Date:   Mon, 2 Sep 2019 20:51:42 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net,
        maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.co, devicetree@vger.kernel.org
Subject: Re: [PATCH 02/13] MIPS: Loongson64: Sepreate loongson2ef/loongson64
 code
Message-ID: <20190902175142.GB4339@darkstar.musicnaut.iki.fi>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-3-jiaxun.yang@flygoat.com>
 <20190827220506.GK30291@darkstar.musicnaut.iki.fi>
 <c03045cd-25df-a3b9-3b3b-cf09b7fdd3fa@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c03045cd-25df-a3b9-3b3b-cf09b7fdd3fa@flygoat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 28, 2019 at 08:37:34AM +0800, Jiaxun Yang wrote:
> On 2019/8/28 上午6:05, Aaro Koskinen wrote:
> Hi Aaro,
> >You need to update lemote2f_defconfig with his patch.
> 
> How to generate this config? We should not edit it manually right?

It's possible to edit changed symbols by hand. Minimal defconfigs are
generated with "make savedefconfig".

A.
