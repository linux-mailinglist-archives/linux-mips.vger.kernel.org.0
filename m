Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972322007EF
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2020 13:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731087AbgFSLgQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Jun 2020 07:36:16 -0400
Received: from elvis.franken.de ([193.175.24.41]:37513 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727814AbgFSLfR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 19 Jun 2020 07:35:17 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jmFIK-0007F9-00; Fri, 19 Jun 2020 13:34:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E6491C06E7; Fri, 19 Jun 2020 13:05:24 +0200 (CEST)
Date:   Fri, 19 Jun 2020 13:05:24 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul@crapouillou.net, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        yanfei.li@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: Re: [PATCH v2 1/1] dt-bindings: MIPS: Document Ingenic SoCs binding.
Message-ID: <20200619110524.GA9391@alpha.franken.de>
References: <20200602183354.39707-1-zhouyanjie@wanyeetech.com>
 <20200602183354.39707-2-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200602183354.39707-2-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 03, 2020 at 02:33:54AM +0800, 周琰杰 (Zhou Yanjie) wrote:
> Document the available properties for the SoC root node and the
> CPU nodes of the devicetree for the Ingenic XBurst SoCs.
> 
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v1->v2:
>     1.Remove unnecessary "items".
>     2.Add "clocks" as suggested by Paul Cercueil.
> 
>  .../bindings/mips/ingenic/ingenic,cpu.yaml         | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
