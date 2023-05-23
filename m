Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78E5B70DF94
	for <lists+linux-mips@lfdr.de>; Tue, 23 May 2023 16:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbjEWOpA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 May 2023 10:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237369AbjEWOox (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 May 2023 10:44:53 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A6948FA
        for <linux-mips@vger.kernel.org>; Tue, 23 May 2023 07:44:51 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 9CD9792009C; Tue, 23 May 2023 16:44:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 95C3892009B;
        Tue, 23 May 2023 15:44:46 +0100 (BST)
Date:   Tue, 23 May 2023 15:44:46 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Manuel Lauss <manuel.lauss@gmail.com>
cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: unhide PATA_PLATFORM
In-Reply-To: <20230509185744.413302-1-manuel.lauss@gmail.com>
Message-ID: <alpine.DEB.2.21.2305231542500.27887@angie.orcam.me.uk>
References: <20230509185744.413302-1-manuel.lauss@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 9 May 2023, Manuel Lauss wrote:

> Alchemy DB1200/DB1300 boards can use the pata_platform driver.
> Unhide the config entry in all of MIPS.

 Why not for the relevant platforms only, just like with SIBYTE_SWARM or 
SIBYTE_LITTLESUR?  Otherwise you clutter the configuration of all the 
irrelevant systems.

  Maciej
